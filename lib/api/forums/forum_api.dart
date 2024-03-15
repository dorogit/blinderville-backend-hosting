import 'package:blinderville/utilities/api.dart';

class ForumAPI {
  Future<List> getTopics() async {
    final resp = await dio.get('/topics');

    return resp.data;
  }
}
