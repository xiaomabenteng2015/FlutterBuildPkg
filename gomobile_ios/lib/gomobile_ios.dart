
import 'gomobile_ios_platform_interface.dart';

class GomobileIos {
  Future<String?> getPlatformVersion() {
    return GomobileIosPlatform.instance.getPlatformVersion();
  }

  Future<String?> getSayHi(String text) {
    return GomobileIosPlatform.instance.getSayHi(text);
  }
}
