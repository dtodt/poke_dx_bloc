import 'dart:async';

import 'package:flutter/foundation.dart' show debugPrint, kReleaseMode;
import 'package:flutter/material.dart' show runApp, WidgetsFlutterBinding;
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'app/app_widget.dart' deferred as app;
import 'firebase_setup.dart' deferred as fb;

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  if (kReleaseMode) {
    debugPrint = (message, {int? wrapWidth}) {};
  }

  await fb.loadLibrary();
  await runZonedGuarded(() async {
    await fb.firebaseSetup();

    await app.loadLibrary();
    runApp(app.AppWidget());
  }, fb.logOnFirebase);
}
