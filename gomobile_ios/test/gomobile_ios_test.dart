import 'package:flutter_test/flutter_test.dart';
import 'package:gomobile_ios/gomobile_ios.dart';
import 'package:gomobile_ios/gomobile_ios_platform_interface.dart';
import 'package:gomobile_ios/gomobile_ios_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockGomobileIosPlatform
    with MockPlatformInterfaceMixin
    implements GomobileIosPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<String?> getSayHi(String text) {
    return Future.value('42');
  }
}

void main() {
  final GomobileIosPlatform initialPlatform = GomobileIosPlatform.instance;

  test('$MethodChannelGomobileIos is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelGomobileIos>());
  });

  test('getPlatformVersion', () async {
    GomobileIos gomobileIosPlugin = GomobileIos();
    MockGomobileIosPlatform fakePlatform = MockGomobileIosPlatform();
    GomobileIosPlatform.instance = fakePlatform;

    expect(await gomobileIosPlugin.getPlatformVersion(), '42');
  });
}
