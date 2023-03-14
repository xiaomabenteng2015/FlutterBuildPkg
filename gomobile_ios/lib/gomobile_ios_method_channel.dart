import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'gomobile_ios_platform_interface.dart';

/// An implementation of [GomobileIosPlatform] that uses method channels.
class MethodChannelGomobileIos extends GomobileIosPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('gomobile_ios');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String?> getSayHi(String text) async {
    final sayHi = await methodChannel.invokeMethod<String>(
      'getSayHi',
      {"text": text},
    );
    return sayHi;
  }
}
