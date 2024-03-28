import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'fuel_api_platform_interface.dart';

/// An implementation of [FuelApiPlatform] that uses method channels.
class MethodChannelFuelApi extends FuelApiPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('fuel_api');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
