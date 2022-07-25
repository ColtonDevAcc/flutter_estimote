import 'package:pigeon/pigeon.dart';

class EstimoteBeacon {
  String? uuid;
}

@HostApi()
abstract class EstimoteAPI {
  void setUpZones(List<String> tags);
}
