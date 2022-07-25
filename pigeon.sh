flutter pub run pigeon \
  --input pigeons/estimote_api.dart \
  --dart_out lib/estimote_api.dart \
  --java_package "com.voodoostack.flutter_estimote" \
  --java_out android/src/main/kotlin/com/voodoostack/flutter_estimote/EstimoteApi.java \
  --experimental_swift_out ios/Classes/EstimoteApi.swift

