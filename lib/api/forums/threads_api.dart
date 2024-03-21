import 'package:blinderville/utilities/api.dart';

class ThreadsAPI {
  Future<List> getThreads(String topicId) async {
    final resp = await dio.get('/threads/threadsByTopics/$topicId');
    return resp.data;
  }
}
