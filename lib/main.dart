import 'dart:async';
import 'dart:developer';
import 'locator/locator.dart' as di;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:test_project/presentation/app/app.dart';

void main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await EasyLocalization.ensureInitialized();
      di.configureDependencies();
      runApp(
        const App(),
      );
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
