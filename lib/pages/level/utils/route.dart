import 'package:flutter/material.dart';

class MyRoute extends MaterialPageRoute {
  MyRoute({required super.builder});

  @override
  Duration get transitionDuration => const Duration(
        seconds: 2,
      );
}
