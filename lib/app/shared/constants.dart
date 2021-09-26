import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_template/app/shared/services/http.service.dart';

Dio get http => Modular.get<HttpService>().dio;
