//
//  ViewController.swift
//  GeoBus
//
//  Created by Ivan Alvarado on 10/12/15.
//  Copyright © 2015 Bus Squad UCSC. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController, NSXMLParserDelegate {
    
    var parser = NSXMLParser()
    var timer  = NSTimer()
    
    // viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // runs viewDidLoad() every 7 seconds
        timer = NSTimer.scheduledTimerWithTimeInterval(7.0, target: self, selector: "viewDidLoad", userInfo: nil, repeats: true)
        
        // get the data from the XML file
        parser = NSXMLParser(contentsOfURL:(NSURL(string:"http://skynet.cse.ucsc.edu/bts/coord2.xml"))!)!
        
        let coord = Coord2()
        parser.delegate = coord
        parser.parse()
        print("coord has a count attribute of \(coord.count)")
        print("coord has \(coord.markers.count) markers")
        
        // displays the map adjusted to UC Santa Cruz
        let camera = GMSCameraPosition.cameraWithLatitude(37.0000,
            longitude: -122.0600, zoom: 14)
        let mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
        mapView.mapType = kGMSTypeNormal
        mapView.myLocationEnabled = true
        self.view = mapView
        
        // loops through all the lats and lngs of the buses and produces a marker
        // for them on our Google Maps app
        for marker in coord.markers {
            print("marker id=\(marker.id), lat=\(marker.lati), lng=\(marker.lngi), route=\(marker.route)")
            
            // displays the buses
            let buses = GMSMarker()
            buses.position = CLLocationCoordinate2DMake(marker.lati, marker.lngi)
            buses.title = marker.route
            if buses.title == "UPPER CAMPUS" {
                buses.icon = UIImage(named: "uppercampus")
            } else if buses.title == "LOOP" {
                buses.icon = UIImage(named: "innerloop")
            }
            buses.snippet = marker.id
            buses.map = mapView
        }
    }

    // didReceiveMemoryWarning()
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// ParseBase class
// simple base class that is used to consume foundCharacters
// via the parser
class ParserBase : NSObject, NSXMLParserDelegate  {
    
    var currentElement:String = ""
    var foundCharacters = ""
    weak var parent:ParserBase? = nil
    
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        
        currentElement = elementName
    }
    
    func parser(parser: NSXMLParser, foundCharacters string: String) {
        self.foundCharacters = string
    }
    
}

// Coord2 class
// represents a coord2 tag
// it has a count attribute
// and a collection of markers
class Coord2 : ParserBase {
    
    var count = 0
    var markers = [Marker]()
    
    // didStartElement()
    override func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        
        print("processing <\(elementName)> tag from Coord")
        
        if elementName == "coord2" {
            
            // if we are processing a coord2 tag, we are at the root
            // of XML file, extract the count value and set it
            print(attributeDict["count"])
            if let c = Int(attributeDict["count"]!) {
                self.count = c
            }
        }
        
        // if we found a marker tag, delegate further responsibility
        // to parsing to a new instance of Marker
        if elementName == "marker" {
            let marker = Marker()
            self.markers.append(marker)
            
            // push responsibility
            parser.delegate = marker
            
            // let marker know who we are
            // so that once marker is done XML processing
            // it can return parsing responsibility back
            marker.parent = self
        }
    }
}

// Marker class
class Marker : ParserBase {
    
    var id = ""
    var lat = ""
    var lng = ""
    var route = ""
    var lati = 0.0
    var lngi = 0.0
    
    // didEndElement()
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        print("processing <\(elementName)> tag from Marker")
        
        // if we finished an item tag, the ParserBase parent
        // would have accumulated the found characters
        // so just assign that to our item variable
        if elementName == "id" {
            self.id = foundCharacters
        }
            
        // convert the lat to a Double
        else if elementName == "lat" {
            self.lat = foundCharacters
            // cast self.lat as Double
            if let doubleFromlat = Double(self.lat) {
                self.lati = doubleFromlat
            } else { print("foundCharacters for lat does not hold double") }
            
        }
            
        // convert the lng to a Double
        else if elementName == "lng" {
            self.lng = foundCharacters
            if let doubleFromlng = Double(self.lng) {
                self.lngi = doubleFromlng
            } else { print("foundCharacters for lng does not hold double") }
        }
            
        else if elementName == "route" {
            self.route = foundCharacters
        }
            
        // if we reached the </marker> tag, we do not
        // have anything further to do, so delegate
        // parsing responsibility to parent
        else if elementName == "marker" {
            parser.delegate = self.parent
        }
        
        // reset found characters
        foundCharacters = ""
    }
    
}