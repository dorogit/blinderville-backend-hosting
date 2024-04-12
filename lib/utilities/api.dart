import 'package:dio/dio.dart';

import '../constants.dart';

Dio dio = Dio(BaseOptions(
  baseUrl: baseUrl,
  headers: {
    'Content-Type': 'application/json',
  },
));
