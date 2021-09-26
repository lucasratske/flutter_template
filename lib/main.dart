import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_template/app/app_module.dart';
import 'package:flutter_template/app/app_widget.dart';

Future<void> main() async {
  final app = ModularApp(module: AppModule(), child: const AppWidget());

  await Modular.isModuleReady<AppModule>();

  runApp(app);
}
