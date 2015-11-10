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
    
    
    func reloadBuses() {
        // clears all old markers
        // mapView.clear()
        
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
                bus7921.title = marker.route
                if bus7921.title == "UPPER CAMPUS" {
                    bus7921.icon = UIImage(named: "uppercampus")
                } else if bus7921.title == "LOOP" {
                    if marker.direc == "inner" {
                        bus7921.icon = UIImage(named: "innerloop")
                    } else if marker.direc == "outer" {
                        bus7921.icon = UIImage(named: "outerloop")
                    }
                }
                bus7921.snippet = marker.id
                bus7921.map = mapView
                busBool7921 = false
            }
            
            if marker.id == "7937" {
                bus7937.position = CLLocationCoordinate2DMake(marker.lati, marker.lngi)
                bus7937.title = marker.route
                if bus7937.title == "UPPER CAMPUS" {
                    bus7937.icon = UIImage(named: "uppercampus")
                } else if bus7937.title == "LOOP" {
                    if marker.direc == "inner" {
                        bus7937.icon = UIImage(named: "innerloop")
                    } else if marker.direc == "outer" {
                        bus7937.icon = UIImage(named: "outerloop")
                    }
                }
                bus7937.snippet = marker.id
                bus7937.map = mapView
                busBool7937 = false
            }
            
            if marker.id == "7925" {
                bus7925.position = CLLocationCoordinate2DMake(marker.lati, marker.lngi)
                bus7925.title = marker.route
                if bus7925.title == "UPPER CAMPUS" {
                    bus7925.icon = UIImage(named: "uppercampus")
                } else if bus7925.title == "LOOP" {
                    if marker.direc == "inner" {
                        bus7925.icon = UIImage(named: "innerloop")
                    } else if marker.direc == "outer" {
                        bus7925.icon = UIImage(named: "outerloop")
                    }
                }
                bus7925.snippet = marker.id
                bus7925.map = mapView
                busBool7925 = false
            }
            
            if marker.id == "7934" {
                bus7934.position = CLLocationCoordinate2DMake(marker.lati, marker.lngi)
                bus7934.title = marker.route
                if bus7934.title == "UPPER CAMPUS" {
                    bus7934.icon = UIImage(named: "uppercampus")
                } else if bus7934.title == "LOOP" {
                    if marker.direc == "inner" {
                        bus7934.icon = UIImage(named: "innerloop")
                    } else if marker.direc == "outer" {
                        bus7934.icon = UIImage(named: "outerloop")
                    }
                }
                bus7934.snippet = marker.id
                bus7934.map = mapView
                busBool7934 = false
            }
            
            if marker.id == "7929" {
                bus7929.position = CLLocationCoordinate2DMake(marker.lati, marker.lngi)
                bus7929.title = marker.route
                if bus7929.title == "UPPER CAMPUS" {
                    bus7929.icon = UIImage(named: "uppercampus")
                } else if bus7929.title == "LOOP" {
                    if marker.direc == "inner" {
                        bus7929.icon = UIImage(named: "innerloop")
                    } else if marker.direc == "outer" {
                        bus7929.icon = UIImage(named: "outerloop")
                    }
                }
                bus7929.snippet = marker.id
                bus7929.map = mapView
                busBool7929 = false
            }
            
            if marker.id == "7928" {
                bus7928.position = CLLocationCoordinate2DMake(marker.lati, marker.lngi)
                bus7928.title = marker.route
                if bus7928.title == "UPPER CAMPUS" {
                    bus7928.icon = UIImage(named: "uppercampus")
                } else if bus7928.title == "LOOP" {
                    if marker.direc == "inner" {
                        bus7928.icon = UIImage(named: "innerloop")
                    } else if marker.direc == "outer" {
                        bus7928.icon = UIImage(named: "outerloop")
                    }
                }
                bus7928.snippet = marker.id
                bus7928.map = mapView
                busBool7928 = false
            }
            
            if marker.id == "7868" {
                bus7868.position = CLLocationCoordinate2DMake(marker.lati, marker.lngi)
                bus7868.title = marker.route
                if bus7868.title == "UPPER CAMPUS" {
                    bus7868.icon = UIImage(named: "uppercampus")
                } else if bus7868.title == "LOOP" {
                    if marker.direc == "inner" {
                        bus7868.icon = UIImage(named: "innerloop")
                    } else if marker.direc == "outer" {
                        bus7868.icon = UIImage(named: "outerloop")
                    }
                }
                bus7868.snippet = marker.id
                bus7868.map = mapView
                busBool7868 = false
            }
            
            if marker.id == "7923" {
                bus7923.position = CLLocationCoordinate2DMake(marker.lati, marker.lngi)
                bus7923.title = marker.route
                if bus7923.title == "UPPER CAMPUS" {
                    bus7923.icon = UIImage(named: "uppercampus")
                } else if bus7923.title == "LOOP" {
                    if marker.direc == "inner" {
                        bus7923.icon = UIImage(named: "innerloop")
                    } else if marker.direc == "outer" {
                        bus7923.icon = UIImage(named: "outerloop")
                    }
                }
                bus7923.snippet = marker.id
                bus7923.map = mapView
                busBool7923 = false
            }
            
            if marker.id == "7869" {
                bus7869.position = CLLocationCoordinate2DMake(marker.lati, marker.lngi)
                bus7869.title = marker.route
                if bus7869.title == "UPPER CAMPUS" {
                    bus7869.icon = UIImage(named: "uppercampus")
                } else if bus7869.title == "LOOP" {
                    if marker.direc == "inner" {
                        bus7869.icon = UIImage(named: "innerloop")
                    } else if marker.direc == "outer" {
                        bus7869.icon = UIImage(named: "outerloop")
                    }
                }
                bus7869.snippet = marker.id
                bus7869.map = mapView
                busBool7869 = false
            }
            
            if marker.id == "7870" {
                bus7870.position = CLLocationCoordinate2DMake(marker.lati, marker.lngi)
                bus7870.title = marker.route
                if bus7870.title == "UPPER CAMPUS" {
                    bus7870.icon = UIImage(named: "uppercampus")
                } else if bus7870.title == "LOOP" {
                    if marker.direc == "inner" {
                        bus7870.icon = UIImage(named: "innerloop")
                    } else if marker.direc == "outer" {
                        bus7870.icon = UIImage(named: "outerloop")
                    }
                }
                bus7870.snippet = marker.id
                bus7870.map = mapView
                busBool7870 = false
            }
            
            if marker.id == "7860" {
                bus7860.position = CLLocationCoordinate2DMake(marker.lati, marker.lngi)
                bus7860.title = marker.route
                if bus7860.title == "UPPER CAMPUS" {
                    bus7860.icon = UIImage(named: "uppercampus")
                } else if bus7860.title == "LOOP" {
                    if marker.direc == "inner" {
                        bus7860.icon = UIImage(named: "innerloop")
                    } else if marker.direc == "outer" {
                        bus7860.icon = UIImage(named: "outerloop")
                    }
                }
                bus7860.snippet = marker.id
                bus7860.map = mapView
                busBool7860 = false
            }
            
            if marker.id == "7927" {
                bus7927.position = CLLocationCoordinate2DMake(marker.lati, marker.lngi)
                bus7927.title = marker.route
                if bus7927.title == "UPPER CAMPUS" {
                    bus7927.icon = UIImage(named: "uppercampus")
                } else if bus7927.title == "LOOP" {
                    if marker.direc == "inner" {
                        bus7927.icon = UIImage(named: "innerloop")
                    } else if marker.direc == "outer" {
                        bus7927.icon = UIImage(named: "outerloop")
                    }
                }
                bus7927.snippet = marker.id
                bus7927.map = mapView
                busBool7927 = false
            }
            
            if marker.id == "7920" {
                bus7920.position = CLLocationCoordinate2DMake(marker.lati, marker.lngi)
                bus7920.title = marker.route
                if bus7920.title == "UPPER CAMPUS" {
                    bus7920.icon = UIImage(named: "uppercampus")
                } else if bus7920.title == "LOOP" {
                    if marker.direc == "inner" {
                        bus7920.icon = UIImage(named: "innerloop")
                    } else if marker.direc == "outer" {
                        bus7920.icon = UIImage(named: "outerloop")
                    }
                }
                bus7920.snippet = marker.id
                bus7920.map = mapView
                busBool7920 = false
            }
            
            if marker.id == "7935" {
                bus7935.position = CLLocationCoordinate2DMake(marker.lati, marker.lngi)
                bus7935.title = marker.route
                if bus7935.title == "UPPER CAMPUS" {
                    bus7935.icon = UIImage(named: "uppercampus")
                } else if bus7935.title == "LOOP" {
                    if marker.direc == "inner" {
                        bus7935.icon = UIImage(named: "innerloop")
                    } else if marker.direc == "outer" {
                        bus7935.icon = UIImage(named: "outerloop")
                    }
                }
                bus7935.snippet = marker.id
                bus7935.map = mapView
                busBool7935 = false
            }
            
            if marker.id == "7926" {
                bus7926.position = CLLocationCoordinate2DMake(marker.lati, marker.lngi)
                bus7926.title = marker.route
                if bus7926.title == "UPPER CAMPUS" {
                    bus7926.icon = UIImage(named: "uppercampus")
                } else if bus7926.title == "LOOP" {
                    if marker.direc == "inner" {
                        bus7926.icon = UIImage(named: "innerloop")
                    } else if marker.direc == "outer" {
                        bus7926.icon = UIImage(named: "outerloop")
                    }
                }
                bus7926.snippet = marker.id
                bus7926.map = mapView
                busBool7926 = false
            }
            
            if marker.id == "7936" {
                bus7936.position = CLLocationCoordinate2DMake(marker.lati, marker.lngi)
                bus7936.title = marker.route
                if bus7936.title == "UPPER CAMPUS" {
                    bus7936.icon = UIImage(named: "uppercampus")
                } else if bus7936.title == "LOOP" {
                    if marker.direc == "inner" {
                        bus7936.icon = UIImage(named: "innerloop")
                    } else if marker.direc == "outer" {
                        bus7936.icon = UIImage(named: "outerloop")
                    }
                }
                bus7936.snippet = marker.id
                bus7936.map = mapView
                busBool7936 = false
            }
            
            if marker.id == "7924" {
                bus7924.position = CLLocationCoordinate2DMake(marker.lati, marker.lngi)
                bus7924.title = marker.route
                if bus7924.title == "UPPER CAMPUS" {
                    bus7924.icon = UIImage(named: "uppercampus")
                } else if bus7924.title == "LOOP" {
                    if marker.direc == "inner" {
                        bus7924.icon = UIImage(named: "innerloop")
                    } else if marker.direc == "outer" {
                        bus7924.icon = UIImage(named: "outerloop")
                    }
                }
                bus7924.snippet = marker.id
                bus7924.map = mapView
                busBool7924 = false
            }
            
            if marker.id == "7855" {
                bus7855.position = CLLocationCoordinate2DMake(marker.lati, marker.lngi)
                bus7855.title = marker.route
                if bus7855.title == "UPPER CAMPUS" {
                    bus7855.icon = UIImage(named: "uppercampus")
                } else if bus7855.title == "LOOP" {
                    if marker.direc == "inner" {
                        bus7855.icon = UIImage(named: "innerloop")
                    } else if marker.direc == "outer" {
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