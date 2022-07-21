import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_estimote/flutter_estimote.dart';
import 'package:flutter_estimote/flutter_estimote_platform_interface.dart';
import 'package:flutter_estimote/flutter_estimote_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterEstimotePlatform 
    with MockPlatformInterfaceMixin
    implements FlutterEstimotePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterEstimotePlatform initialPlatform = FlutterEstimotePlatform.instance;

  test('$MethodChannelFlutterEstimote is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterEstimote>());
  });

  test('getPlatformVersion', () async {
    FlutterEstimote flutterEstimotePlugin = FlutterEstimote();
    MockFlutterEstimotePlatform fakePlatform = MockFlutterEstimotePlatform();
    FlutterEstimotePlatform.instance = fakePlatform;
  
    expect(await flutterEstimotePlugin.getPlatformVersion(), '42');
  });
}
