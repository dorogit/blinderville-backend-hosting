import 'package:blinderville/api/forums/threads_api.dart';
import "package:flutter/foundation.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:hooks_riverpod/hooks_riverpod.dart';

class _ThreadsNotifier extends ChangeNotifier {
  final String topicId;
  bool isLoading = false;
  String currentThreadId = "";
  List<Map<String, dynamic>>? threads;

  _ThreadsNotifier({required this.topicId});

  Future<void> loadThreads() async {
    isLoading = true;
    notifyListeners();

    final response = await ThreadsAPI.getThreads(topicId);

    if (response != null) {
      threads = response;
    }
    isLoading = false;
    notifyListeners();
  }

  void setCurrentThreadId(String threadId) {
    currentThreadId = threadId;
    notifyListeners();
  }
}

/// Provider to handle threads
final threadsProvider = ChangeNotifierProvider.family<_ThreadsNotifier, String>(
    (_, topicId) => _ThreadsNotifier(topicId: topicId));
