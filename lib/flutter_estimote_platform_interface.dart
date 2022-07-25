import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_estimote_method_channel.dart';

abstract class FlutterEstimotePlatform extends PlatformInterface {
  /// Constructs a FlutterEstimotePlatform.
  FlutterEstimotePlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterEstimotePlatform _instance = MethodChannelFlutterEstimote();

  /// The default instance of [FlutterEstimotePlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterEstimote].
  static FlutterEstimotePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterEstimotePlatform] when
  /// they register themselves.
  static set instance(FlutterEstimotePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }
}
