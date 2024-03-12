import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Forums extends ConsumerWidget {
  const Forums({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                    ForumRow('Forums', 'Latest Posts', 'Posts', 'Threads'),
                    ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (idx, context) =>
                      ForumRow('Meetups & Events', 'Some', '6', '3'))
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

class ForumRow extends StatelessWidget {
  ForumRow(
    this.c1,
    this.c2,
    this.c3,
    this.c4, {
    super.key,
  });
  String? c1;
  String? c2;
  String? c3;
  String? c4;
  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
