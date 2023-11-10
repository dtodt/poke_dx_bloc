import 'package:firebase_analytics/firebase_analytics.dart' deferred as fb_a;
import 'package:firebase_core/firebase_core.dart' deferred as fb_co;
import 'package:firebase_crashlytics/firebase_crashlytics.dart'
    deferred as fb_cr;
import 'package:firebase_performance/firebase_performance.dart'
    deferred as fb_p;
import 'package:flutter/foundation.dart'
    show kDebugMode, kIsWeb, PlatformDispatcher;
import 'package:flutter/material.dart' show FlutterError;

import 'firebase_options.dart';

Future<void> firebaseSetup() async {
  await Future.wait([
    fb_a.loadLibrary(),
    fb_co.loadLibrary(),
    fb_p.loadLibrary(),
  ]);

  await fb_co.Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await fb_a.FirebaseAnalytics.instance
      .setAnalyticsCollectionEnabled(!kDebugMode);

  await fb_p.FirebasePerformance.instance
      .setPerformanceCollectionEnabled(!kDebugMode);

  if (!kIsWeb) {
    await fb_cr.loadLibrary();
    await fb_cr.FirebaseCrashlytics.instance
        .setCrashlyticsCollectionEnabled(!kDebugMode);
    FlutterError.onError =
        fb_cr.FirebaseCrashlytics.instance.recordFlutterFatalError;
    PlatformDispatcher.instance.onError = (error, stack) {
      fb_cr.FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  }
}
