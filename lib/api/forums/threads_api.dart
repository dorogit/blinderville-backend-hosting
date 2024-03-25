import 'dart:convert'; // Import this for JSON decoding

import 'package:blinderville/utilities/api.dart';

abstract class ThreadsAPI {
  static Future<List<Map<String, dynamic>>?> getThreads(String topicId) async {
    try {
      final resp = await dio.get('/threads/threadsByTopics/$topicId');
      return resp.data;
    } catch (e) {
      return null;
    }
  }

  static Future<Map<String, dynamic>> getThread(String threadId) async {
    final resp = await dio.get('/threads/$threadId');
    // Decode the response JSON string to a Map<String, dynamic>
    final threadData = json.decode(resp.data);
    return threadData;
  }
}
