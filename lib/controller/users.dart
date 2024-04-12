import 'package:blinderville/api/forums/user_api.dart';
import "package:flutter/foundation.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:hooks_riverpod/hooks_riverpod.dart';

class _UserNotifier extends ChangeNotifier {
  Map<String, dynamic>? userData;

  _UserNotifier();

  Future<void> postUserData(String username, String email, String password,
      String zipCode, Map<String, dynamic> bioQuestions) async {
    notifyListeners();

    final response =
        await UserAPI.post(username, email, password, zipCode, bioQuestions);

    userData = response;

    notifyListeners();
  }
}

final userProvider = ChangeNotifierProvider((ref) => _UserNotifier());
