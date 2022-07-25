import 'package:flutter/services.dart';
import 'dart:async';

class TestAPI {
  static const EventChannel channel = EventChannel('flutter_estimote');

  static Future<String> get beacons async {
    final String beaconTag =
        channel.receiveBroadcastStream().cast().first.toString(); //("setUpZones", "Beacon");

    return beaconTag;
  }

  // New
  static Stream<String> get beaconAsStream {
    return channel.receiveBroadcastStream().cast();
  }
}
