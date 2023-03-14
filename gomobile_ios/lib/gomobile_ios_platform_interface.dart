import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'gomobile_ios_method_channel.dart';

abstract class GomobileIosPlatform extends PlatformInterface {
  /// Constructs a GomobileIosPlatform.
  GomobileIosPlatform() : super(token: _token);

  static final Object _token = Object();

  static GomobileIosPlatform _instance = MethodChannelGomobileIos();

  /// The default instance of [GomobileIosPlatform] to use.
  ///
  /// Defaults to [MethodChannelGomobileIos].
  static GomobileIosPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [GomobileIosPlatform] when
  /// they register themselves.
  static set instance(GomobileIosPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> getSayHi(String text) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
