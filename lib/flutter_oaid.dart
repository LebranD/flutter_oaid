import 'flutter_oaid_platform_interface.dart';

class FlutterOaid {
  Future<String?> getPlatformVersion() {
    return FlutterOaidPlatform.instance.getOaid();
  }

  Future<void> register() {
    return FlutterOaidPlatform.instance.register();
  }
}
