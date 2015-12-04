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
    
    // necessary for positioning the toggle button
    let screenSize = UIScreen.mainScreen().bounds
    var screenWidth : CGFloat!
    var screenHeight : CGFloat!
    
    @IBOutlet var mapView: GMSMapView!
    let bus7921 = GMSMarker()
    let bus7937 = GMSMarker()
    let bus7925 = GMSMarker()
    let bus7934 = GMSMarker()
    let bus7929 = GMSMarker()
    let bus7928 = GMSMarker()
    let bus7868 = GMSMarker()
    let bus7923 = GMSMarker()
    let bus7869 = GMSMarker()
    let bus7870 = GMSMarker()
    let bus7860 = GMSMarker()
    let bus7927 = GMSMarker()
    let bus7920 = GMSMarker()
    let bus7935 = GMSMarker()
    let bus7926 = GMSMarker()
    let bus7936 = GMSMarker()
    let bus7924 = GMSMarker()
    let bus7855 = GMSMarker()
    var buttonclick = true;
    
    // viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // displays the map adjusted to UC Santa Cruz
        let camera = GMSCameraPosition.cameraWithLatitude(36.9900,
            longitude: -122.0605, zoom: 14)
        mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
        mapView.mapType = kGMSTypeNormal
        mapView.myLocationEnabled = true
        self.view = mapView
        
        // x-axis of device screen
        screenWidth = screenSize.width * 0.5
        
        // y-axis of device screen
        screenHeight = screenSize.height
        
        // button to toggle bus stops on and off
        let busbutton = UIButton(type: UIButtonType.System) as UIButton
        busbutton.frame = CGRectMake(screenWidth - 75,500,150,50)
        busbutton.backgroundColor=UIColor.lightGrayColor();
        busbutton.layer.cornerRadius = 15
        if(buttonclick == true){
            busbutton.setTitle("Hide Bus Stops", forState: UIControlState.Normal)
        }
        if(buttonclick == false){
            busbutton.setTitle("Show Bus Stops", forState: UIControlState.Normal)
        }
        busbutton.addTarget(self, action: "buttonAction:", forControlEvents: .TouchUpInside)
        self.view.addSubview(busbutton)
        
        // bus stops
        if(buttonclick == true){
        let marker1 = GMSMarker()
        marker1.position = CLLocationCoordinate2DMake(36.985370, -122.060099)
        marker1.title = "University of California Santa Cruz"
        marker1.snippet = "Mascot: Sammy the Slug"
        marker1.appearAnimation = kGMSMarkerAnimationPop
        marker1.icon = UIImage(named:"slug")
        marker1.map = mapView
        
        let marker2 = GMSMarker()
        marker2.position = CLLocationCoordinate2DMake(36.999719, -122.058393)
        marker2.title = "McLaughlin & College 9/10"
        marker2.snippet = "15 19"
        marker2.appearAnimation = kGMSMarkerAnimationPop
        marker2.icon = UIImage(named:"bus_stop_orange")
        marker2.map = mapView
        
        let marker3 = GMSMarker()
        marker3.position = CLLocationCoordinate2DMake(36.999901, -122.058372)
        marker3.title = "McLaughlin & College 9/10"
        marker3.snippet = "10 12 20 16"
        marker3.appearAnimation = kGMSMarkerAnimationPop
        marker3.icon = UIImage(named:"bus_stop_blue")
        marker3.map = mapView
        
        let marker4 = GMSMarker()
        marker4.position = CLLocationCoordinate2DMake(36.999913, -122.062371)
        marker4.title = "McLaughlin & Science Hill"
        marker4.snippet = "10 12 20 16"
        marker4.appearAnimation = kGMSMarkerAnimationPop
        marker4.icon = UIImage(named:"bus_stop_blue")
        marker4.map = mapView
        
        let marker5 = GMSMarker()
        marker5.position = CLLocationCoordinate2DMake(36.999809, -122.062068)
        marker5.title = "McLaughlin & Science Hill"
        marker5.snippet = "15 19"
        marker5.appearAnimation = kGMSMarkerAnimationPop
        marker5.icon = UIImage(named:"bus_stop_orange")
        marker5.map = mapView
        
        let marker6 = GMSMarker()
        marker6.position = CLLocationCoordinate2DMake(36.999198, -122.064371)
        marker6.title = "Heller & Kresge College"
        marker6.snippet = "15 19"
        marker6.appearAnimation = kGMSMarkerAnimationPop
        marker6.icon = UIImage(named:"bus_stop_orange")
        marker6.map = mapView
        
        let marker7 = GMSMarker()
        marker7.position = CLLocationCoordinate2DMake(36.999225, -122.064522)
        marker7.title = "Heller & Kresge College"
        marker7.snippet = "10 12 20 16"
        marker7.appearAnimation = kGMSMarkerAnimationPop
        marker7.icon = UIImage(named:"bus_stop_blue")
        marker7.map = mapView
        
        let marker8 = GMSMarker()
        marker8.position = CLLocationCoordinate2DMake(36.996736, -122.063586)
        marker8.title = "Heller & Kerr Hall"
        marker8.snippet = "15 19"
        marker8.appearAnimation = kGMSMarkerAnimationPop
        marker8.icon = UIImage(named:"bus_stop_orange")
        marker8.map = mapView
        
        let marker9 = GMSMarker()
        marker9.position = CLLocationCoordinate2DMake(36.992781, -122.064729)
        marker9.title = "Heller & College 8/Porter"
        marker9.snippet = "15 19"
        marker9.appearAnimation = kGMSMarkerAnimationPop
        marker9.icon = UIImage(named:"bus_stop_orange")
        marker9.map = mapView
        
        let marker10 = GMSMarker()
        marker10.position = CLLocationCoordinate2DMake(36.993011, -122.065332)
        marker10.title = "Heller & College 8/Porter"
        marker10.snippet = "10 12 20 16"
        marker10.appearAnimation = kGMSMarkerAnimationPop
        marker10.icon = UIImage(named:"bus_stop_blue")
        marker10.map = mapView
        
        let marker11 = GMSMarker()
        marker11.position = CLLocationCoordinate2DMake(36.991710, -122.066808)
        marker11.title = "Heller & Family Student Housing"
        marker11.snippet = "10 12 20 16"
        marker11.appearAnimation = kGMSMarkerAnimationPop
        marker11.icon = UIImage(named:"bus_stop_blue")
        marker11.map = mapView
        
        let marker12 = GMSMarker()
        marker12.position = CLLocationCoordinate2DMake(36.990675, -122.066070)
        marker12.title = "Heller & Oakes College"
        marker12.snippet = "15 19"
        marker12.appearAnimation = kGMSMarkerAnimationPop
        marker12.icon = UIImage(named:"bus_stop_orange")
        marker12.map = mapView
        
        let marker13 = GMSMarker()
        marker13.position = CLLocationCoordinate2DMake(36.989923, -122.067298)
        marker13.title = "Heller & Oakes College"
        marker13.snippet = "10 12 20 16"
        marker13.appearAnimation = kGMSMarkerAnimationPop
        marker13.icon = UIImage(named:"bus_stop_blue")
        marker13.map = mapView
        
        let marker14 = GMSMarker()
        marker14.position = CLLocationCoordinate2DMake(36.983681, -122.065073)
        marker14.title = "Empire Grade & Arboretum"
        marker14.snippet = "10 12 20 16"
        marker14.appearAnimation = kGMSMarkerAnimationPop
        marker14.icon = UIImage(named:"bus_stop_blue")
        marker14.map = mapView
        
        let marker15 = GMSMarker()
        marker15.position = CLLocationCoordinate2DMake(36.982729, -122.062573)
        marker15.title = "Empire Grade & Arboretum"
        marker15.snippet = "15 19"
        marker15.appearAnimation = kGMSMarkerAnimationPop
        marker15.icon = UIImage(named:"bus_stop_orange")
        marker15.map = mapView
        
        let marker16 = GMSMarker()
        marker16.position = CLLocationCoordinate2DMake(36.979882, -122.059269)
        marker16.title = "Empire Grade & Tosca Terrace"
        marker16.snippet = "10 12 20 16"
        marker16.appearAnimation = kGMSMarkerAnimationPop
        marker16.icon = UIImage(named:"bus_stop_blue")
        marker16.map = mapView
        
        let marker17 = GMSMarker()
        marker17.position = CLLocationCoordinate2DMake(36.978753, -122.057694)
        marker17.title = "High & Western Dr."
        marker17.snippet = "15 19"
        marker17.appearAnimation = kGMSMarkerAnimationPop
        marker17.icon = UIImage(named:"bus_stop_orange")
        marker17.map = mapView
        
        let marker18 = GMSMarker()
        marker18.position = CLLocationCoordinate2DMake(36.978658, -122.057826)
        marker18.title = "High & Western Dr."
        marker18.snippet = "10 12 20 16"
        marker18.appearAnimation = kGMSMarkerAnimationPop
        marker18.icon = UIImage(named:"bus_stop_blue")
        marker18.map = mapView
        
        let marker19 = GMSMarker()
        marker19.position = CLLocationCoordinate2DMake(36.977317, -122.054255)
        marker19.title = "High & Barn Theater"
        marker19.snippet = "15 19"
        marker19.appearAnimation = kGMSMarkerAnimationPop
        marker19.icon = UIImage(named:"bus_stop_orange")
        marker19.map = mapView
        
        let marker20 = GMSMarker()
        marker20.position = CLLocationCoordinate2DMake(36.977654, -122.053599)
        marker20.title = "Main Entrance"
        marker20.snippet = "10 12 20 16"
        marker20.appearAnimation = kGMSMarkerAnimationPop
        marker20.icon = UIImage(named:"bus_stop_blue")
        marker20.map = mapView
        
        let marker21 = GMSMarker()
        marker21.position = CLLocationCoordinate2DMake(36.981535, -122.052068)
        marker21.title = "Coolidge Dr. & Lower Campus"
        marker21.snippet = "15 19"
        marker21.appearAnimation = kGMSMarkerAnimationPop
        marker21.icon = UIImage(named:"bus_stop_orange")
        marker21.map = mapView
        
        let marker22 = GMSMarker()
        marker22.position = CLLocationCoordinate2DMake(36.981430, -122.051962)
        marker22.title = "Coolidge Dr. & Lower Campus"
        marker22.snippet = "10 12 20 16"
        marker22.appearAnimation = kGMSMarkerAnimationPop
        marker22.icon = UIImage(named:"bus_stop_blue")
        marker22.map = mapView
        
        let marker23 = GMSMarker()
        marker23.position = CLLocationCoordinate2DMake(36.985438, -122.053505)
        marker23.title = "Hagar & Lower Quarry Rd."
        marker23.snippet = "15 19"
        marker23.appearAnimation = kGMSMarkerAnimationPop
        marker23.icon = UIImage(named:"bus_stop_orange")
        marker23.map = mapView
        
        let marker24 = GMSMarker()
        marker24.position = CLLocationCoordinate2DMake(36.985851, -122.053511)
        marker24.title = "Hagar & Lower Quarry Rd."
        marker24.snippet = "10 12 20 16"
        marker24.appearAnimation = kGMSMarkerAnimationPop
        marker24.icon = UIImage(named:"bus_stop_blue")
        marker24.map = mapView
        
        let marker25 = GMSMarker()
        marker25.position = CLLocationCoordinate2DMake(36.991276, -122.054696)
        marker25.title = "Hagar & East Remote Parking Lot"
        marker25.snippet = "10 12 20 16"
        marker25.appearAnimation = kGMSMarkerAnimationPop
        marker25.icon = UIImage(named:"bus_stop_blue")
        marker25.map = mapView
        
        let marker26 = GMSMarker()
        marker26.position = CLLocationCoordinate2DMake(36.991263, -122.054873)
        marker26.title = "Hagar & East Remote Parking Lot"
        marker26.snippet = "15 19"
        marker26.appearAnimation = kGMSMarkerAnimationPop
        marker26.icon = UIImage(named:"bus_stop_orange")
        marker26.map = mapView
        
        let marker27 = GMSMarker()
        marker27.position = CLLocationCoordinate2DMake(36.994220, -122.055522)
        marker27.title = "Hagar & East Field House"
        marker27.snippet = "10 12 20 16"
        marker27.appearAnimation = kGMSMarkerAnimationPop
        marker27.icon = UIImage(named:"bus_stop_blue")
        marker27.map = mapView
        
        let marker28 = GMSMarker()
        marker28.position = CLLocationCoordinate2DMake(36.996636, -122.055431)
        marker28.title = "Hagar & Bookstore"
        marker28.snippet = "15 19"
        marker28.appearAnimation = kGMSMarkerAnimationPop
        marker28.icon = UIImage(named:"bus_stop_orange")
        marker28.map = mapView
        
        let marker29 = GMSMarker()
        marker29.position = CLLocationCoordinate2DMake(36.997455, -122.055066)
        marker29.title = "Hagar & Bookstore"
        marker29.snippet = "10 12 20 16"
        marker29.appearAnimation = kGMSMarkerAnimationPop
        marker29.icon = UIImage(named:"bus_stop_blue")
        marker29.map = mapView
        
        let marker30 = GMSMarker()
        marker30.position = CLLocationCoordinate2DMake(36.999009, -122.055230)
        marker30.title = "McLaughlin & Crown College"
        marker30.snippet = "10 12 20 16"
        marker30.appearAnimation = kGMSMarkerAnimationPop
        marker30.icon = UIImage(named:"bus_stop_blue")
        marker30.map = mapView
        }
        
        // xml file
        parser = NSXMLParser(contentsOfURL:(NSURL(string:"http://skynet.cse.ucsc.edu/bts/coord2.xml"))!)!
        
        // build obejects for xml data
        let coord = Coord2()
        parser.delegate = coord
        parser.parse()
        print("coord has a count attribute of \(coord.count)")
        print("coord has \(coord.markers.count) markers")
        
        reloadBuses()
        
        
        
        // runs reloadBuses() every 10 seconds
        timer = NSTimer.scheduledTimerWithTimeInterval(10.0, target: self, selector: "reloadBuses", userInfo: nil, repeats: true)
        
    }
    
    // button click function
    func buttonAction(sender:UIButton!){
        print("Button Clicked")
        buttonclick = !buttonclick
        print(buttonclick)
        viewDidLoad()
    }
    
    // displays and removes buses
    func reloadBuses() {
        
        // bools for buses to know which are in service
        var busBool7921 = true
        var busBool7937 = true
        var busBool7925 = true
        var busBool7934 = true
        var busBool7929 = true
        var busBool7928 = true
        var busBool7868 = true
        var busBool7923 = true
        var busBool7869 = true
        var busBool7870 = true
        var busBool7860 = true
        var busBool7927 = true
        var busBool7920 = true
        var busBool7935 = true
        var busBool7926 = true
        var busBool7936 = true
        var busBool7924 = true
        var busBool7855 = true
        
        // communicate with xml file
        parser = NSXMLParser(contentsOfURL:(NSURL(string:"http://skynet.cse.ucsc.edu/bts/coord2.xml"))!)!
        
        // build objects from xml data
        let coord = Coord2()
        parser.delegate = coord
        parser.parse()
        print("coord has a count attribute of \(coord.count)")
        print("coord has \(coord.markers.count) markers")
        
        // loops through all the lats and lngs of the buses and produces a marker each on map
        for marker in coord.markers {
            print("marker id=\(marker.id), lat=\(marker.lati), lng=\(marker.lngi), route=\(marker.route)")
            
            if marker.id == "7921" {
                bus7921.position = CLLocationCoordinate2DMake(marker.lati, marker.lngi)
                if marker.route == "UPPER CAMPUS" {
                    bus7921.title = "UPPER CAMPUS"
                    bus7921.icon = UIImage(named: "uppercampus")
                } else if marker.route == "LOOP" {
                    if marker.direc == "inner" {
                        bus7921.title = "INNER LOOP"
                        bus7921.icon = UIImage(named: "innerloop")
                    } else if marker.direc == "outer" {
                        bus7921.title = "OUTER LOOP"
                        bus7921.icon = UIImage(named: "outerloop")
                    }
                }
                bus7921.snippet = marker.id
                bus7921.map = mapView
                busBool7921 = false
            }
            
            if marker.id == "7937" {
                bus7937.position = CLLocationCoordinate2DMake(marker.lati, marker.lngi)
                if marker.route == "UPPER CAMPUS" {
                    bus7937.title = "UPPER CAMPUS"
                    bus7937.icon = UIImage(named: "uppercampus")
                } else if marker.route == "LOOP" {
                    if marker.direc == "inner" {
                        bus7937.title = "INNER LOOP"
                        bus7937.icon = UIImage(named: "innerloop")
                    } else if marker.direc == "outer" {
                        bus7937.title = "OUTER LOOP"
                        bus7937.icon = UIImage(named: "outerloop")
                    }
                }
                bus7937.snippet = marker.id
                bus7937.map = mapView
                busBool7937 = false
            }
            
            if marker.id == "7925" {
                bus7925.position = CLLocationCoordinate2DMake(marker.lati, marker.lngi)
                if marker.route == "UPPER CAMPUS" {
                    bus7925.title = "UPPER CAMPUS"
                    bus7925.icon = UIImage(named: "uppercampus")
                } else if marker.route == "LOOP" {
                    if marker.direc == "inner" {
                        bus7925.title = "INNER LOOP"
                        bus7925.icon = UIImage(named: "innerloop")
                    } else if marker.direc == "outer" {
                        bus7925.title = "OUTER LOOP"
                        bus7925.icon = UIImage(named: "outerloop")
                    }
                }
                bus7925.snippet = marker.id
                bus7925.map = mapView
                busBool7925 = false
            }
            
            if marker.id == "7934" {
                bus7934.position = CLLocationCoordinate2DMake(marker.lati, marker.lngi)
                if marker.route == "UPPER CAMPUS" {
                    bus7934.title = "UPPER CAMPUS"
                    bus7934.icon = UIImage(named: "uppercampus")
                } else if marker.route == "LOOP" {
                    if marker.direc == "inner" {
                        bus7934.title = "INNER LOOP"
                        bus7934.icon = UIImage(named: "innerloop")
                    } else if marker.direc == "outer" {
                        bus7934.title = "OUTER LOOP"
                        bus7934.icon = UIImage(named: "outerloop")
                    }
                }
                bus7934.snippet = marker.id
                bus7934.map = mapView
                busBool7934 = false
            }
            
            if marker.id == "7929" {
                bus7929.position = CLLocationCoordinate2DMake(marker.lati, marker.lngi)
                if marker.route == "UPPER CAMPUS" {
                    bus7929.title = "UPPER CAMPUS"
                    bus7929.icon = UIImage(named: "uppercampus")
                } else if marker.route == "LOOP" {
                    if marker.direc == "inner" {
                        bus7929.title = "INNER LOOP"
                        bus7929.icon = UIImage(named: "innerloop")
                    } else if marker.direc == "outer" {
                        bus7929.title = "OUTER LOOP"
                        bus7929.icon = UIImage(named: "outerloop")
                    }
                }
                bus7929.snippet = marker.id
                bus7929.map = mapView
                busBool7929 = false
            }
            
            if marker.id == "7928" {
                bus7928.position = CLLocationCoordinate2DMake(marker.lati, marker.lngi)
                if marker.route == "UPPER CAMPUS" {
                    bus7928.title = "UPPER CAMPUS"
                    bus7928.icon = UIImage(named: "uppercampus")
                } else if marker.route == "LOOP" {
                    if marker.direc == "inner" {
                        bus7928.title = "INNER LOOP"
                        bus7928.icon = UIImage(named: "innerloop")
                    } else if marker.direc == "outer" {
                        bus7928.title = "OUTER LOOP"
                        bus7928.icon = UIImage(named: "outerloop")
                    }
                }
                bus7928.snippet = marker.id
                bus7928.map = mapView
                busBool7928 = false
            }
            
            if marker.id == "7868" {
                bus7868.position = CLLocationCoordinate2DMake(marker.lati, marker.lngi)
                if marker.route == "UPPER CAMPUS" {
                    bus7868.title = "UPPER CAMPUS"
                    bus7868.icon = UIImage(named: "uppercampus")
                } else if marker.route == "LOOP" {
                    if marker.direc == "inner" {
                        bus7868.title = "INNER LOOP"
                        bus7868.icon = UIImage(named: "innerloop")
                    } else if marker.direc == "outer" {
                        bus7868.title = "OUTER LOOP"
                        bus7868.icon = UIImage(named: "outerloop")
                    }
                }
                bus7868.snippet = marker.id
                bus7868.map = mapView
                busBool7868 = false
            }
            
            if marker.id == "7923" {
                bus7923.position = CLLocationCoordinate2DMake(marker.lati, marker.lngi)
                if marker.route == "UPPER CAMPUS" {
                    bus7923.title = "UPPER CAMPUS"
                    bus7923.icon = UIImage(named: "uppercampus")
                } else if marker.route == "LOOP" {
                    if marker.direc == "inner" {
                        bus7923.title = "INNER LOOP"
                        bus7923.icon = UIImage(named: "innerloop")
                    } else if marker.direc == "outer" {
                        bus7923.title = "OUTER LOOP"
                        bus7923.icon = UIImage(named: "outerloop")
                    }
                }
                bus7923.snippet = marker.id
                bus7923.map = mapView
                busBool7923 = false
            }
            
            if marker.id == "7869" {
                bus7869.position = CLLocationCoordinate2DMake(marker.lati, marker.lngi)
                if marker.route == "UPPER CAMPUS" {
                    bus7869.title = "UPPER CAMPUS"
                    bus7869.icon = UIImage(named: "uppercampus")
                } else if marker.route == "LOOP" {
                    if marker.direc == "inner" {
                        bus7869.title = "INNER LOOP"
                        bus7869.icon = UIImage(named: "innerloop")
                    } else if marker.direc == "outer" {
                        bus7869.title = "OUTER LOOP"
                        bus7869.icon = UIImage(named: "outerloop")
                    }
                }
                bus7869.snippet = marker.id
                bus7869.map = mapView
                busBool7869 = false
            }
            
            if marker.id == "7870" {
                bus7870.position = CLLocationCoordinate2DMake(marker.lati, marker.lngi)
                if marker.route == "UPPER CAMPUS" {
                    bus7870.title = "UPPER CAMPUS"
                    bus7870.icon = UIImage(named: "uppercampus")
                } else if marker.route == "LOOP" {
                    if marker.direc == "inner" {
                        bus7870.title = "INNER LOOP"
                        bus7870.icon = UIImage(named: "innerloop")
                    } else if marker.direc == "outer" {
                        bus7870.title = "OUTER LOOP"
                        bus7870.icon = UIImage(named: "outerloop")
                    }
                }
                bus7870.snippet = marker.id
                bus7870.map = mapView
                busBool7870 = false
            }
            
            if marker.id == "7860" {
                bus7860.position = CLLocationCoordinate2DMake(marker.lati, marker.lngi)
                if marker.route == "UPPER CAMPUS" {
                    bus7860.title = "UPPER CAMPUS"
                    bus7860.icon = UIImage(named: "uppercampus")
                } else if marker.route == "LOOP" {
                    if marker.direc == "inner" {
                        bus7860.title = "INNER LOOP"
                        bus7860.icon = UIImage(named: "innerloop")
                    } else if marker.direc == "outer" {
                        bus7860.title = "OUTER LOOP"
                        bus7860.icon = UIImage(named: "outerloop")
                    }
                }
                bus7860.snippet = marker.id
                bus7860.map = mapView
                busBool7860 = false
            }
            
            if marker.id == "7927" {
                bus7927.position = CLLocationCoordinate2DMake(marker.lati, marker.lngi)
                if marker.route == "UPPER CAMPUS" {
                    bus7927.title = "UPPER CAMPUS"
                    bus7927.icon = UIImage(named: "uppercampus")
                } else if marker.route == "LOOP" {
                    if marker.direc == "inner" {
                        bus7927.title = "INNER LOOP"
                        bus7927.icon = UIImage(named: "innerloop")
                    } else if marker.direc == "outer" {
                        bus7927.title = "OUTER LOOP"
                        bus7927.icon = UIImage(named: "outerloop")
                    }
                }
                bus7927.snippet = marker.id
                bus7927.map = mapView
                busBool7927 = false
            }
            
            if marker.id == "7920" {
                bus7920.position = CLLocationCoordinate2DMake(marker.lati, marker.lngi)
                if marker.route == "UPPER CAMPUS" {
                    bus7920.title = "UPPER CAMPUS"
                    bus7920.icon = UIImage(named: "uppercampus")
                } else if marker.route == "LOOP" {
                    if marker.direc == "inner" {
                        bus7920.title = "INNER LOOP"
                        bus7920.icon = UIImage(named: "innerloop")
                    } else if marker.direc == "outer" {
                        bus7920.title = "OUTER LOOP"
                        bus7920.icon = UIImage(named: "outerloop")
                    }
                }
                bus7920.snippet = marker.id
                bus7920.map = mapView
                busBool7920 = false
            }
            
            if marker.id == "7935" {
                bus7935.position = CLLocationCoordinate2DMake(marker.lati, marker.lngi)
                if marker.route == "UPPER CAMPUS" {
                    bus7935.title = "UPPER CAMPUS"
                    bus7935.icon = UIImage(named: "uppercampus")
                } else if marker.route == "LOOP" {
                    if marker.direc == "inner" {
                        bus7935.title = "INNER LOOP"
                        bus7935.icon = UIImage(named: "innerloop")
                    } else if marker.direc == "outer" {
                        bus7935.title = "OUTER LOOP"
                        bus7935.icon = UIImage(named: "outerloop")
                    }
                }
                bus7935.snippet = marker.id
                bus7935.map = mapView
                busBool7935 = false
            }
            
            if marker.id == "7926" {
                bus7926.position = CLLocationCoordinate2DMake(marker.lati, marker.lngi)
                if marker.route == "UPPER CAMPUS" {
                    bus7926.title = "UPPER CAMPUS"
                    bus7926.icon = UIImage(named: "uppercampus")
                } else if marker.route == "LOOP" {
                    if marker.direc == "inner" {
                        bus7926.title = "INNER LOOP"
                        bus7926.icon = UIImage(named: "innerloop")
                    } else if marker.direc == "outer" {
                        bus7926.title = "OUTER LOOP"
                        bus7926.icon = UIImage(named: "outerloop")
                    }
                }
                bus7926.snippet = marker.id
                bus7926.map = mapView
                busBool7926 = false
            }
            
            if marker.id == "7936" {
                bus7936.position = CLLocationCoordinate2DMake(marker.lati, marker.lngi)
                if marker.route == "UPPER CAMPUS" {
                    bus7936.title = "UPPER CAMPUS"
                    bus7936.icon = UIImage(named: "uppercampus")
                } else if marker.route == "LOOP" {
                    if marker.direc == "inner" {
                        bus7936.title = "INNER LOOP"
                        bus7936.icon = UIImage(named: "innerloop")
                    } else if marker.direc == "outer" {
                        bus7936.title = "OUTER LOOP"
                        bus7936.icon = UIImage(named: "outerloop")
                    }
                }
                bus7936.snippet = marker.id
                bus7936.map = mapView
                busBool7936 = false
            }
            
            if marker.id == "7924" {
                bus7924.position = CLLocationCoordinate2DMake(marker.lati, marker.lngi)
                if marker.route == "UPPER CAMPUS" {
                    bus7924.title = "UPPER CAMPUS"
                    bus7924.icon = UIImage(named: "uppercampus")
                } else if marker.route == "LOOP" {
                    if marker.direc == "inner" {
                        bus7924.title = "INNER LOOP"
                        bus7924.icon = UIImage(named: "innerloop")
                    } else if marker.direc == "outer" {
                        bus7924.title = "OUTER LOOP"
                        bus7924.icon = UIImage(named: "outerloop")
                    }
                }
                bus7924.snippet = marker.id
                bus7924.map = mapView
                busBool7924 = false
            }
            
            if marker.id == "7855" {
                bus7855.position = CLLocationCoordinate2DMake(marker.lati, marker.lngi)
                if marker.route == "UPPER CAMPUS" {
                    bus7855.title = "UPPER CAMPUS"
                    bus7855.icon = UIImage(named: "uppercampus")
                } else if marker.route == "LOOP" {
                    if marker.direc == "inner" {
                        bus7855.title = "INNER LOOP"
                        bus7855.icon = UIImage(named: "innerloop")
                    } else if marker.direc == "outer" {
                        bus7855.title = "OUTER LOOP"
                        bus7855.icon = UIImage(named: "outerloop")
                    }
                }
                bus7855.snippet = marker.id
                bus7855.map = mapView
                busBool7855 = false
            }
            
        }
        
        // remove markers that aren't in service anymore
        if busBool7921 { bus7921.map = nil }
        if busBool7937 { bus7937.map = nil }
        if busBool7925 { bus7925.map = nil }
        if busBool7934 { bus7934.map = nil }
        if busBool7929 { bus7929.map = nil }
        if busBool7928 { bus7928.map = nil }
        if busBool7868 { bus7868.map = nil }
        if busBool7923 { bus7923.map = nil }
        if busBool7869 { bus7869.map = nil }
        if busBool7870 { bus7870.map = nil }
        if busBool7860 { bus7860.map = nil }
        if busBool7927 { bus7927.map = nil }
        if busBool7920 { bus7920.map = nil }
        if busBool7935 { bus7935.map = nil }
        if busBool7926 { bus7926.map = nil }
        if busBool7936 { bus7936.map = nil }
        if busBool7924 { bus7924.map = nil }
        if busBool7855 { bus7855.map = nil }
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
    var direc = ""
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
        
        else if elementName == "direction" {
            self.direc = foundCharacters
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