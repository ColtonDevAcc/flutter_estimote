import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_estimote_platform_interface.dart';

/// An implementation of [FlutterEstimotePlatform] that uses method channels.
class MethodChannelFlutterEstimote extends FlutterEstimotePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_estimote');

  @override
  Future<Stream?> getPlatformVersion() async {
    final Stream version = await methodChannel.invokeMethod('getPlatformVersion');
    return version;
  }
}
