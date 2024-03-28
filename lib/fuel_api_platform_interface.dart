import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'fuel_api_method_channel.dart';

abstract class FuelApiPlatform extends PlatformInterface {
  /// Constructs a FuelApiPlatform.
  FuelApiPlatform() : super(token: _token);

  static final Object _token = Object();

  static FuelApiPlatform _instance = MethodChannelFuelApi();

  /// The default instance of [FuelApiPlatform] to use.
  ///
  /// Defaults to [MethodChannelFuelApi].
  static FuelApiPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FuelApiPlatform] when
  /// they register themselves.
  static set instance(FuelApiPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
