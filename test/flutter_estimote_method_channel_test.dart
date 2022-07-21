import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_estimote/flutter_estimote_method_channel.dart';

void main() {
  MethodChannelFlutterEstimote platform = MethodChannelFlutterEstimote();
  const MethodChannel channel = MethodChannel('flutter_estimote');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
