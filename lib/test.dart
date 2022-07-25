import 'dart:developer';

import 'package:flutter/services.dart';

class TestAPI {
  static const platform = MethodChannel('flutter_estimote');

  dynamic getData(Map<String, String> tags) async {
    try {
      log("retrieving");
      final data = await platform.invokeMethod<String>('setUpZones', tags);
      log("retrieved the following data $data");
      return data;
    } on PlatformException catch (e) {
      log("error:$e");
    }
  }
}
