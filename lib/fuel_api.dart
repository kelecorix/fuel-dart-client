
import 'fuel_api_platform_interface.dart';

class FuelApi {
  Future<String?> getPlatformVersion() {
    return FuelApiPlatform.instance.getPlatformVersion();
  }
}
