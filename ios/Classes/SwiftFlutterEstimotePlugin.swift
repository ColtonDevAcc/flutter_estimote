import Flutter
import UIKit

public class SwiftFlutterEstimotePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "version", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterEstimotePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)

    let setupZonesChannel = FlutterEventChannel(name: "flutter_estimote", binaryMessenger: registrar.messenger())
    let estimoteBeaconStreamHandler = EstimoteBeaconStreamHandler()
    setupZonesChannel.setStreamHandler(estimoteBeaconStreamHandler)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      result("iOS " + UIDevice.current.systemVersion)
  }
}

