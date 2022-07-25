import Foundation
import Flutter
import EstimoteProximitySDK


class EstimoteBeaconStreamHandler: NSObject, FlutterStreamHandler{
    var sink: FlutterEventSink?
    var timer: Timer?
    
    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        sink = events
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(setupZones), userInfo: nil, repeats: true)
        return nil
    }
    
    @objc func setupZones() {
        guard let sink = sink else { return }
        let credentials = CloudCredentials(appID: "cbristow99-gmail-com-s-uni-lhr", appToken: "b328f4cb1a6df760b9d0e3ac2e740c28")

        let proximityObserver = ProximityObserver(credentials: credentials, onError: { error in
            print("Oops! \(error)")
        })
          // Define zones
        let blueberryZone = ProximityZone(tag: "Beacon", range: ProximityRange(desiredMeanTriggerDistance: 9.0)!)
        
        blueberryZone.onEnter = { zoneContext in
            sink("yes")
            sink("Entered near range of tag tags[0]. Attachments payload: \(zoneContext.attachments)")
        }
        blueberryZone.onExit = { zoneContext in
                    sink("yes")

            sink("Exited near range of tag tags[0]. Attachment payload: \(zoneContext.attachments)")
        }

        blueberryZone.onContextChange = {_ in sink("context")}

        proximityObserver.startObserving([blueberryZone])
    }
    
    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        sink = nil
        timer?.invalidate()
        return nil
    }
}