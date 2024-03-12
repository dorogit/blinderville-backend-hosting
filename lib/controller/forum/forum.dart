import 'package:blinderville/api/forums/forum_api.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'forum.g.dart';


@riverpod
Future<List> forum(Ref ref) async{
  final topics =await ForumAPI().getTopics();
  // print('svdv: $topics');
  return topics;
}