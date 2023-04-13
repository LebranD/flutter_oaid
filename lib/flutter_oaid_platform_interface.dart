import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_oaid_method_channel.dart';

abstract class FlutterOaidPlatform extends PlatformInterface {
  /// Constructs a FlutterOaidPlatform.
  FlutterOaidPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterOaidPlatform _instance = MethodChannelFlutterOaid();

  /// The default instance of [FlutterOaidPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterOaid].
  static FlutterOaidPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterOaidPlatform] when
  /// they register themselves.
  static set instance(FlutterOaidPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getOaid();

  Future<void> register();
}
