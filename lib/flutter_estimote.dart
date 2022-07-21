
import 'flutter_estimote_platform_interface.dart';

class FlutterEstimote {
  Future<String?> getPlatformVersion() {
    return FlutterEstimotePlatform.instance.getPlatformVersion();
  }
}
