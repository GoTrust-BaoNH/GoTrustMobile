import 'package:get/get.dart';
import 'package:go_trust/resource/config/config_environment.dart';

class ConfigService {
  Future<EnvConfiguration> init(String environment) async {
    Get.lazyPut<EnvConfiguration>(() => EnvConfiguration(environment: environment));
    return EnvConfiguration(environment: environment);
  }
}
