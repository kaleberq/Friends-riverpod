import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friends/route/routes.dart';

void main() {
  runApp(ProviderScope(
      child: MaterialApp.router(
    routerConfig: router,
  )));
}
