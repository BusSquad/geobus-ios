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
        
        print("The route is")
        let t = elements["route"]!
        print(t)
        print("The timestamp is")
        let u = elements["timestamp"]!
        print(u)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // didStartElement
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
    
    // foundCharacters
    func parser(parser: NSXMLParser, foundCharacters string: String)
    {
        if element.isEqualToString("route") {
            route.appendString(string)
        } else if element.isEqualToString("timestamp") {
            timestamp.appendString(string)
        }
    }
    
    // didEndElement
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

