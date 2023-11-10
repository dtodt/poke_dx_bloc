import 'package:flutter/material.dart';

///
mixin StateReadyAware<T extends StatefulWidget> on State<T> {
  void ready();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => ready());
  }
}
