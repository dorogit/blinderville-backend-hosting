import 'package:blinderville/utilities/api.dart';

abstract class PostAPI {
  static Future<Map<String, dynamic>> post(
    String threadId,
    String title,
    String description,
    String userId,
    bool isThreadPost,
  ) async {
    try {
      final resp = await dio.post('/posts/', data: {
        'threadId': threadId, // Ensure the key is a string
        'isThreadPost': isThreadPost, // Ensure the key is a string
        'title': title, // Ensure the key is a string
        'description': description, // Ensure the key is a string
        'userId': userId, // Ensure the key is a string
      });
      // Decode the response JSON string to a Map<String, dynamic>
      final Map<String, dynamic> postData = resp.data;
      return postData;
    } catch (e) {
      print("Error posting: $e");
      // You might want to handle error differently for post
      rethrow;
    }
  }
}
