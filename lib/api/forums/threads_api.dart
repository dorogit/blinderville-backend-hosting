import 'package:blinderville/utilities/api.dart';

class ThreadsAPI {
  Future<List> getThreads() async {
    final resp = await dio.get('/threads');
    return resp.data;
  }
}
