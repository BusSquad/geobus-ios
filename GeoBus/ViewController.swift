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
    
    var strXMLData:String = ""
    var currentElement:String = ""
    var passData:Bool=false
    var passName:Bool=false
    var parser = NSXMLParser()
    
    //@IBOutlet var lblNameData : UILabel! = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url:String="http://skynet.cse.ucsc.edu/bts/coord2.xml"
        let urlToSend: NSURL = NSURL(string: url)!
        // Parse the XML
        parser = NSXMLParser(contentsOfURL: urlToSend)!
        parser.delegate = self
        
        let success:Bool = parser.parse()
        
        if success {
            print("parse success!")
            
            //print(strXMLData)
            
            //lblNameData.text=strXMLData
            
        } else {
            print("parse failure!")
        }
        
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
    
    func parser(_parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        currentElement=elementName;
        if(elementName=="id" || elementName=="lat" || elementName=="lng" || elementName=="timeshare"
            || elementName=="route" || elementName=="predictions")
        {
            if(elementName=="lat"){
                passName=true;
            }
            passData=true;
            print("Element's name is \(elementName)")
            print(attributeDict[elementName])
        }
    }
    
    func parser(_parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        currentElement="";
        if(elementName=="id" || elementName=="name" || elementName=="lng" || elementName=="timestamp")
        {
            if(elementName=="name"){
                passName=false;
            }
            passData=false;
        }
    }
    
    func parser(_parser: NSXMLParser, foundCharacters string: String) {
        if(passName){
            strXMLData=strXMLData+"\n\n"+string
        }
        
        if(passData)
        {
            print(string)
        }
    }
    
    func parser(_parser: NSXMLParser, parseErrorOccurred parseError: NSError) {
        NSLog("failure error: %@", parseError)
    }


}

