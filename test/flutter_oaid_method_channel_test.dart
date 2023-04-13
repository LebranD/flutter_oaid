import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_oaid/flutter_oaid_method_channel.dart';

void main() {
  MethodChannelFlutterOaid platform = MethodChannelFlutterOaid();
  const MethodChannel channel = MethodChannel('flutter_oaid');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });
}
