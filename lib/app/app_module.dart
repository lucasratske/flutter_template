import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_template/app/modules/search/search_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.instance<Dio>(Dio()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: SearchModule()),
  ];
}
