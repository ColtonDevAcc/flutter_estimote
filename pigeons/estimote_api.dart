import 'package:pigeon/pigeon.dart';

class EstimoteBeacon {
  String? uuid;
}

@HostApi()
abstract class EstimoteAPI {
  EstimoteBeacon fetch(String uuid);
}
