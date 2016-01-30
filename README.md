# GeoBus (iOS)

THIS PROJECT HAS MOVED TO [THIS](https://github.com/ivanalvarado/GeoBus) REPOSITORY.

GeoBus is a mobile application that tracks the position of active buses on the University of California, Santa Cruz campus. This is the iOS variant. You can find the Android repository [here](https://github.com/BusSquad/geobus-android).

Requirements
------------

The most current source code is compatible with Xcode v. 7.2 and Swift 2.0.

Libraries
---------

Our project uses the [Google Maps SDK for iOS](https://developers.google.com/maps/documentation/ios-sdk/intro). You can install it to your project using the CocoaPods tool following [these](https://developers.google.com/maps/documentation/ios-sdk/start) steps. You will need a Google Developer API key which is also explained in the 'Get Started' steps.

To Do
-----

If you clone the repository this issue might be taken care of, but it's always good to double check. When we first tried parsing our XML file, we kept getting the following error:

```shell
Transport security has blocked a cleartext HTTP (http://) resource load since it is insecure. Temporary exceptions can be configured via your app's Info.plist file.
```

This is because,

"... whenever your application attempts to connect to any HTTP server (in this example, yourserver.com) that doesn't support the latest SSL technology (TLSv1.2), your connections will fail.

The reason why Apple is pushing so aggressively to force secure connections is because it’s the right thing to do. Protecting personal data from being compromised over insecure wireless connections, among other things, is great for users. Just because these exceptions exist doesn’t mean you should actually use them." [[source](http://ste.vn/2015/06/10/configuring-app-transport-security-ios-9-osx-10-11/)]

To bypass this error, you'll need to add the following code to your Info.plist file:

```
<key>NSAppTransportSecurity</key>  
     <dict>  
          <key>NSAllowsArbitraryLoads</key><true/>  
     </dict>
```

Documentation
-------------

You can find User and Developer Documentation [here](https://github.com/BusSquad/geobus-ios/blob/master/documentation/User-Developer%20Documentation.pdf) or navigate to the 'Documentation' directory. The Developer Documentation provides a detailed explanation of how the source code is structured.

Issues
------

If you encounter any issues running the code or find any bugs, please submit an 'Issue' ticket [here](https://github.com/BusSquad/geobus-ios/issues).