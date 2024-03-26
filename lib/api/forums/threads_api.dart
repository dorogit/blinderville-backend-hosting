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
      print("Error fetching 11111 threads: $e");
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
      print("Error fetching threa222d: $e");
      // You might want to handle error differently for getThread
      rethrow;
    }
  }

  static Future<Map<String, dynamic>> postThread(
      String topicId, String title, String description, String userId) async {
    try {
      final resp = await dio.post('/threads/', data: {
        'topicId': topicId, // Ensure the key is a string
        'name': title, // Ensure the key is a string
        'description': description, // Ensure the key is a string
        'userId': userId, // Ensure the key is a string
      });
      // Decode the response JSON string to a Map<String, dynamic>
      final Map<String, dynamic> threadData = resp.data;
      return threadData;
    } catch (e) {
      print("Error posting threa222d: $e");
      // You might want to handle error differently for getThread
      rethrow;
    }
  }
}
