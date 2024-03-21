import 'package:blinderville/api/forums/threads_api.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Topic {
  const Topic({
    required this.currentTopicId,
    required this.currentTopicName,
    required this.currentTopicDesc,
    required this.isLoading,
  });

  final String currentTopicId;
  final String currentTopicName;
  final String currentTopicDesc;
  final bool isLoading;

  Topic copyWith({
    String? currentTopicId,
    String? currentTopicName,
    String? currentTopicDesc,
    bool? isLoading,
  }) {
    return Topic(
      currentTopicId: currentTopicId ?? this.currentTopicId,
      currentTopicName: currentTopicName ?? this.currentTopicName,
      currentTopicDesc: currentTopicDesc ?? this.currentTopicDesc,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class TopicsNotifier extends StateNotifier<Topic> {
  TopicsNotifier()
      : super(Topic(
          currentTopicId: "",
          currentTopicName: "",
          currentTopicDesc: "",
          isLoading: false,
        ));

  void setCurrentTopic({
    required String currentTopicId,
    required String currentTopicName,
    required String currentTopicDesc,
    bool isLoading = false,
  }) {
    state = Topic(
      currentTopicId: currentTopicId,
      currentTopicName: currentTopicName,
      currentTopicDesc: currentTopicDesc,
      isLoading: isLoading,
    );
  }

  void setLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }
}

final currentTopicProvider =
    StateNotifierProvider<TopicsNotifier, Topic>((ref) {
  return TopicsNotifier();
});

final threadsProvider = FutureProvider<List>((ref) async {
  final currentThread = ref.watch(currentTopicProvider);
  final threadsAPI = ThreadsAPI(); // Assuming you have configured Dio
  final threads = await threadsAPI.getThreads(currentThread.currentTopicId);
  return threads;
});
