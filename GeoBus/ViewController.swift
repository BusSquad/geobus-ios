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
    var posts = NSMutableArray()
    var elements = NSMutableDictionary()
    var element = NSString()
    var route = NSMutableString()
    var timestamp = NSMutableString()
    
    func beginParsing()
    {
        posts = []
        parser = NSXMLParser(contentsOfURL:(NSURL(string:"http://skynet.cse.ucsc.edu/bts/coord2.xml"))!)!
        parser.delegate = self
        parser.parse()
        //tbData!.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        beginParsing()
        
        let t = elements["route"]!
        print(t)
        print("previous is route")
        let u = elements["timestamp"]!
        print(u)
        print("previous is timestamp")
        
        // Displays the map adjusted to UC Santa Cruz
        let camera = GMSCameraPosition.cameraWithLatitude(37.0000,
            longitude: -122.0600, zoom: 14)
        let mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
        mapView.mapType = kGMSTypeNormal
        mapView.myLocationEnabled = true
        self.view = mapView
        
        // Displays Marker
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(37.0000, -122.0600)
        marker.title = "UC Santa Cruz"
        marker.snippet = "Santa Cruz, CA"
        marker.icon = UIImage(named: "busstop")
        marker.map = mapView
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String])
    {
        element = elementName
        if (elementName as NSString).isEqualToString("marker")
        {
            elements = NSMutableDictionary()
            elements = [:]
            route = NSMutableString()
            route = ""
            timestamp = NSMutableString()
            timestamp = ""
        }
    }
    
    func parser(parser: NSXMLParser, foundCharacters string: String)
    {
        if element.isEqualToString("route") {
            route.appendString(string)
        } else if element.isEqualToString("timestamp") {
            timestamp.appendString(string)
        }
    }
    
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?)
    {
        if (elementName as NSString).isEqualToString("marker") {
            if !route.isEqual(nil) {
                elements.setObject(route, forKey: "route")
            }
            if !timestamp.isEqual(nil) {
                elements.setObject(timestamp, forKey: "timestamp")
            }
            posts.addObject(elements)
        }
    }

}

