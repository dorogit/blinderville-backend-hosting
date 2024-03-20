import 'package:blinderville/controller/forum/forum.dart';
import 'package:blinderville/controller/forum/threads.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Forums extends HookConsumerWidget {
  final Function(int) updateParentIndex;
  const Forums({
    super.key,
    required this.updateParentIndex,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final forum = ref.watch(forumProvider);

    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                Center(
                  child: Text(
                    'WELCOME TO THE BLINDERVILLE FORUM',
                    textScaler: TextScaler.linear(1.6),
                    style: TextStyle(color: Color.fromARGB(255, 120, 67, 255)),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Mingle, Explore, Discover, Find...'),
                    Text(
                      ' The One',
                      textScaler: TextScaler.linear(1.2),
                      style:
                          TextStyle(color: Color.fromARGB(255, 120, 67, 255)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 25),
        Center(
          child: Text(
            'Forum rules and Code of Conduct',
            textScaler: TextScaler.linear(1.2),
            style: TextStyle(color: Color.fromARGB(255, 120, 67, 255)),
          ),
        ),
        SizedBox(height: 25),
        Card(
          child: Column(
            children: [
              Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 25),
                    Row(
                      children: [
                        SizedBox(width: 10),
                        Expanded(
                          flex: 3,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromARGB(255, 28, 27, 30),
                              border: Border(
                                left: BorderSide(
                                  color: Color.fromARGB(255, 109, 29, 249),
                                  width: 5,
                                ),
                                bottom: BorderSide(
                                  color: Color.fromARGB(255, 109, 29, 249),
                                  width: 3,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(15),
                              child: Center(child: Text("Forums")),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          flex: 2,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromARGB(255, 28, 27, 30),
                              border: Border(
                                left: BorderSide(
                                  color: Color.fromARGB(255, 109, 29, 249),
                                  width: 5,
                                ),
                                bottom: BorderSide(
                                  color: Color.fromARGB(255, 109, 29, 249),
                                  width: 3,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(15),
                              child: Center(child: Text("Latest Post")),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromARGB(255, 28, 27, 30),
                              border: Border(
                                left: BorderSide(
                                  color: Color.fromARGB(255, 109, 29, 249),
                                  width: 5,
                                ),
                                bottom: BorderSide(
                                  color: Color.fromARGB(255, 109, 29, 249),
                                  width: 3,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(15),
                              child: Center(child: Text("Threads")),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromARGB(255, 28, 27, 30),
                              border: Border(
                                left: BorderSide(
                                  color: Color.fromARGB(255, 109, 29, 249),
                                  width: 5,
                                ),
                                bottom: BorderSide(
                                  color: Color.fromARGB(255, 109, 29, 249),
                                  width: 3,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(15),
                              child: Center(child: Text("Posts")),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                    forum.isLoading
                        ? CircularProgressIndicator()
                        : ListView.builder(
                            padding: EdgeInsets.fromLTRB(15, 25, 15, 25),
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: forum.value!.length,
                            itemBuilder: (context, idx) {
                              Map data = forum.value![idx];
                              return ForumRow(data['title'], 'Some', '6', '3',
                                  data['_id'], updateParentIndex);
                            },
                          ),
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
class ForumRow extends HookConsumerWidget {
  ForumRow(
    this.c1,
    this.c2,
    this.c3,
    this.c4,
    this.threadId,
    this.updateParentIndex, {
    super.key,
  });

  String? c1;
  String? c2;
  String? c3;
  String? c4;
  String threadId;
  Function updateParentIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        final currentThread = ref.watch(currentThreadProvider);
        updateParentIndex(4);

        ref.read(currentThreadProvider.notifier).setCurrentThread(threadId);
        print(
          "OKAKOSKAOD $currentThread",
        );
      },
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 28, 27, 30),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: ListTile(
                      title: Text(
                        c1 ?? '',
                        style: TextStyle(
                          color: Color.fromARGB(255, 120, 67, 255),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 28, 27, 30),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: ListTile(
                      title: Text(
                        c2 ?? '',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 28, 27, 30),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: ListTile(
                      title: Text(
                        c3 ?? '',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 28, 27, 30),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: ListTile(
                      title: Text(
                        c4 ?? '',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 15)
        ],
      ),
    );
  }
}
