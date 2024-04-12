import 'package:blinderville/utilities/api.dart';

abstract class UserAPI {
  static Future<Map<String, dynamic>> post(
    String? username,
    String? email,
    String? zipcode,
    String? password,
    Map<String, dynamic>? bioQuestions,
  ) async {
    try {
      final resp = await dio.post('/users/', data: {
        'username': username,
        'email': email,
        'zipCode': zipcode,
        'password': password,
        'bioQuestions': bioQuestions,
      });
      // Decode the response JSON string to a Map<String, dynamic>
      final Map<String, dynamic> userData = resp.data;
      return userData;
    } catch (e) {
      print(e);
      // You might want to handle error differently for post
      rethrow;
    }
  }
}
