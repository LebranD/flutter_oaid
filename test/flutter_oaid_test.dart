import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_oaid/flutter_oaid.dart';
import 'package:flutter_oaid/flutter_oaid_platform_interface.dart';
import 'package:flutter_oaid/flutter_oaid_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterOaidPlatform with MockPlatformInterfaceMixin implements FlutterOaidPlatform {
  @override
  Future<String?> getOaid() {
    throw UnimplementedError();
  }

  @override
  Future<void> register() {
    throw UnimplementedError();
  }
}

void main() {
  final FlutterOaidPlatform initialPlatform = FlutterOaidPlatform.instance;

  test('$MethodChannelFlutterOaid is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterOaid>());
  });
}
