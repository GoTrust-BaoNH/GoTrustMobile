import 'package:flutter/material.dart';

import 'base/di.dart';
import 'main_app.dart';
import 'shared/constants/common.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjection.init(UAT_ENVIRONMENT);

  runApp(App());
  configLoading();
}
