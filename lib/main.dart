import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_trust/shared/constants/common.dart';

import 'base/di.dart';
import 'main_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await DependencyInjection.init(DEV_ENVIRONMENT);

  runApp(App());
  configLoading();
}
