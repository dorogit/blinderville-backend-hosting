import 'dart:convert';

import 'package:blinderville/constants.dart';
import 'package:blinderville/utilities/api.dart';
import 'package:http/http.dart' as http;

class ForumAPI {
  Future<List> getTopics()async{
    final resp = await dio.get('/topics');
    
    return resp.data;
  }
}
