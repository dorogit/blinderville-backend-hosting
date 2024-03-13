import 'dart:convert';

import 'package:blinderville/constants.dart';
import 'package:blinderville/utilities/api.dart';
import 'package:http/http.dart' as http;

class ThreadsAPI {
  Future<List> getThreads() async {
    final resp = await dio.get('/threads');
    return resp.data;
  }
}
