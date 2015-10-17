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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        parser = NSXMLParser(contentsOfURL:(NSURL(string:"http://skynet.cse.ucsc.edu/bts/coord2.xml"))!)!
        
        let coord = Coord2()
        parser.delegate = coord
        parser.parse()
        print("coord has a count attribute of \(coord.count)")
        print("coord has \(coord.markers.count) markers")
        
        for marker in coord.markers {
            print("marker item = \(marker.id) and lat = \(marker.lati)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// Simple base class that is used to consume foundCharacters
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

// Represents a coord2 tag
// It has a count attribute
// and a collection of markers
class Coord2 : ParserBase {
    
    var count = 0
    var markers = [Marker]()
    
    override func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        
        print("processing <\(elementName)> tag from Coord")
        
        if elementName == "coord2" {
            
            // if we are processing a coord2 tag, we are at the root
            // of this example
            // extract the count value and set it
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

// The Marker class
class Marker : ParserBase {
    
    var id = ""
    var lat = ""
    var lng = ""
    var route = ""
    var lati = 0.0
    
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        print("processing <\(elementName)> tag from Marker")
        
        // if we finished an item tag, the ParserBase parent
        // would have accumulated the found characters
        // so just assign that to our item variable
        if elementName == "id" {
            self.id = foundCharacters
        }
            
        // similarly for lat tags
        // convert the lat to an int for example
        else if elementName == "lat" {
            self.lat = foundCharacters
            //print(foundCharacters)
            //let newString = (self.lat).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
            //print(newString)
            //print(Float(newString))
            if let doubleFromlat = Double(self.lat) {
                self.lati = doubleFromlat
            } else { print("foundCharacters does not hold double") }
            
        }
            
        else if elementName == "lng" {
            self.lng = foundCharacters
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