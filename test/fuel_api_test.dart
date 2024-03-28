import 'package:flutter_test/flutter_test.dart';
import 'package:fuel_api/fuel_api.dart';
import 'package:fuel_api/fuel_api_platform_interface.dart';
import 'package:fuel_api/fuel_api_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFuelApiPlatform
    with MockPlatformInterfaceMixin
    implements FuelApiPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FuelApiPlatform initialPlatform = FuelApiPlatform.instance;

  test('$MethodChannelFuelApi is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFuelApi>());
  });

  test('getPlatformVersion', () async {
    FuelApi fuelApiPlugin = FuelApi();
    MockFuelApiPlatform fakePlatform = MockFuelApiPlatform();
    FuelApiPlatform.instance = fakePlatform;

    expect(await fuelApiPlugin.getPlatformVersion(), '42');
  });
}
