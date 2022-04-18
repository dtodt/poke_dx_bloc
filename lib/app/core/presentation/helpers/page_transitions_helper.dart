import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

///? Disables page transition on web platform.
class PageTransitionsHelper extends PageTransitionsTheme {
  @override
  Widget buildTransitions<T>(
    route,
    context,
    animation,
    secondaryAnimation,
    child,
  ) {
    if (kIsWeb) {
      return child;
    }
    return super.buildTransitions(
      route,
      context,
      animation,
      secondaryAnimation,
      child,
    );
  }
}
