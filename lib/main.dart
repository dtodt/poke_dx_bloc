import 'dart:async';

import 'package:flutter/foundation.dart' show debugPrint, kReleaseMode;
import 'package:flutter/material.dart' show runApp, WidgetsFlutterBinding;

import 'app/app_widget.dart' deferred as app;

Future<void> main() async {
  if (kReleaseMode) {
    debugPrint = (message, {int? wrapWidth}) {};
  }

  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await app.loadLibrary();
    runApp(app.AppWidget());
  }, (error, _) {
    debugPrint('Error: $error');
  });
}
