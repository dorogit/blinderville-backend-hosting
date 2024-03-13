import 'package:blinderville/api/forums/threads_api.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'threads.g.dart';

@riverpod
Future<List> threads(Ref ref) async {
  final topics = await ThreadsAPI().getThreads();
  // print('svdv: $topics');
  return topics;
}
