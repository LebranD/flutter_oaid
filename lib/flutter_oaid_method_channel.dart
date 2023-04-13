import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_oaid_platform_interface.dart';

/// An implementation of [FlutterOaidPlatform] that uses method channels.
class MethodChannelFlutterOaid extends FlutterOaidPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_oaid');

  @override
  Future<String?> getOaid() async {
    assert(Platform.isAndroid);
    final oaid = await methodChannel.invokeMethod<String>('getOaid');
    return oaid;
  }

  @override
  Future<void> register() async {
    assert(Platform.isAndroid);
    await methodChannel.invokeMethod('register');
  }
}
