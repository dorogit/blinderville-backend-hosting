import 'package:blinderville/utilities/api.dart';

abstract class ThreadsAPI {
  static Future<List<Map<String, dynamic>>?> getThreads(String topicId) async {
    try {
      final resp = await dio.get('/threads/threadsByTopics/$topicId');

      // Decode the response JSON array to a List<Map<String, dynamic>>
      List<dynamic> responseData = resp.data;
      List<Map<String, dynamic>> threadList =
          responseData.cast<Map<String, dynamic>>();

      return threadList;
    } catch (e) {
      print("Error fetching threads: $e");
      return null;
    }
  }

  static Future<Map<String, dynamic>> getThread(String threadId) async {
    try {
      final resp = await dio.get('/threads/$threadId');
      // Decode the response JSON string to a Map<String, dynamic>
      final Map<String, dynamic> threadData = resp.data;
      return threadData;
    } catch (e) {
      print("Error fetching thread: $e");
      // You might want to handle error differently for getThread
      rethrow;
    }
  }
}
