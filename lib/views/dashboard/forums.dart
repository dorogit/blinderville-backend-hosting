import 'package:blinderville/controller/forum/forum.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Forums extends HookConsumerWidget {
  final Function(int) updateParentIndex;
  const Forums(
      {super.key,
      required this.updateParentIndex}); // Accept pageIndex parameter

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final forum = ref.watch(forumProvider);
    print(forum);
    return Column(
      children: [
        Card(
          child: SizedBox(
              width: double.infinity,
              height: 100,
              child: Center(child: Text('Welcome to Blinderville'))),
        ),
        Card(
          child: Column(
            children: [
              Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ForumRow('Forums', 'Latest Posts', 'Posts', 'Threads',
                        updateParentIndex),
                    forum.isLoading
                        ? CircularProgressIndicator()
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: forum.value!.length,
                            itemBuilder: (context, idx) {
                              Map data = forum.value![idx];
                              print('a:$data["title"]');
                              return ForumRow(data['title'], 'Some', '6', '3',
                                  updateParentIndex);
                            })
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class ForumRow extends StatelessWidget {
  ForumRow(
    this.c1,
    this.c2,
    this.c3,
    this.c4,
    this.updateParentIndex, {
    super.key,
  });
  String? c1;
  String? c2;
  String? c3;
  String? c4;
  Function(int) updateParentIndex;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //context.go('/forum/meetups');
        updateParentIndex(4);
      },
      child: Row(
        children: [
          Expanded(
              flex: 3,
              child: Card(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(c1 ?? ''),
              ))),
          Expanded(
              flex: 2,
              child: Card(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(c2 ?? ''),
              ))),
          Expanded(
              child: Card(
                  child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(c3 ?? ''),
          ))),
          Expanded(
              child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(c4 ?? ''),
            ),
          ))
        ],
      ),
    );
  }
}
