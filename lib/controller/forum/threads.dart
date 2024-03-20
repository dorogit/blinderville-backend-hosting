import 'package:blinderville/api/forums/threads_api.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CurrentThreadNotifier extends StateNotifier<String> {
  CurrentThreadNotifier() : super("");

  void setCurrentThread(String threadId) {
    state = threadId;
  }
}

final currentThreadProvider =
    StateNotifierProvider<CurrentThreadNotifier, String>((ref) {
  return CurrentThreadNotifier();
});

final threadsProvider = FutureProvider<List>((ref) async {
  final currentThread = ref.watch(currentThreadProvider);
  final threadsAPI = ThreadsAPI(); // Assuming you have configured Dio
  final threads = await threadsAPI.getThreads(currentThread);
  return threads;
});
