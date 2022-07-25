import Flutter
import UIKit
import EstimoteProximitySDK

public class SwiftFlutterEstimotePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_estimote", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterEstimotePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if(call.method.elementsEqual("setUpZones")){
      let arguments = call.arguments as? Dictionary<String, Any>
      let key = arguments!.values.first! as? String ?? ""
      
        let credentials = CloudCredentials(appID: "cbristow99-gmail-com-s-uni-lhr", appToken: "b328f4cb1a6df760b9d0e3ac2e740c28")

        // Create observer instance
        let proximityObserver = ProximityObserver(credentials: credentials, onError: { error in
              print("Oops! \(error)")
          })
          // Define zones
          let blueberryZone = ProximityZone(tag: key, range: ProximityRange.near)
          blueberryZone.onEnter = { zoneContext in
              print("Entered near range of tag tags[0]. Attachments payload: \(zoneContext.attachments)")
          }
          blueberryZone.onExit = { zoneContext in
              print("Exited near range of tag tags[0]. Attachment payload: \(zoneContext.attachments)")
          }

          blueberryZone.onContextChange = { contexts in
              print("Now in range of \(contexts.count) contexts")
          }

          // ... etc. You can define as many zones as you need.

          // Start proximity observation
          let startProx = proximityObserver.startObserving([blueberryZone])
        result(blueberryZone.attachments)
        
    }else{
      result("iOS " + UIDevice.current.systemVersion)
    }
  }
}

