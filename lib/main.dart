import 'dart:async';

import 'package:flutter/foundation.dart' show debugPrint, kReleaseMode;
import 'package:flutter/material.dart' show runApp, WidgetsFlutterBinding;

import 'app/app_widget.dart' deferred as app;
import 'firebase_setup.dart' deferred as fb;

Future<void> main() async {
  if (kReleaseMode) {
    debugPrint = (message, {int? wrapWidth}) {};
  }

  await fb.loadLibrary();
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await fb.firebaseSetup();

    await app.loadLibrary();
    runApp(app.AppWidget());
  }, fb.logOnFirebase);
}
