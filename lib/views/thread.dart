import 'package:blinderville/controller/forum/forum.dart';
import 'package:blinderville/controller/forum/threads.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Thread extends HookConsumerWidget {
  final Function(int) updateParentIndex;
  const Thread({
    super.key,
    required this.updateParentIndex,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTopic = ref.watch(currentTopicProvider);
    final currentThreadsNotifier = threadsProvider(currentTopic.currentTopicId);
    final currentThreadsProvider = ref.read(
      threadsProvider(currentTopic.currentTopicId),
    );
    final isLoading = ref.watch(
      currentThreadsNotifier.select((value) => value.isLoading),
    );
    final threads = ref.watch(
      currentThreadsNotifier.select((value) => value.threads),
    );

    useEffect(
      () {
        currentThreadsProvider.loadThreads();
        return null;
      },
      [],
    );
    //ref.read(currentTopicProvider.notifier).setLoading(false);

    return Column(
      children: [
        Card(
          child: Padding(
            padding: EdgeInsets.all(30),
            child: ListTile(
              leading: Icon(Icons.people),
              title: Text(
                currentTopic.currentTopicName,
                textScaler: TextScaler.linear(1.5),
              ),
              subtitle: Text(currentTopic.currentTopicDesc),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Card(
          child: Padding(
            padding: EdgeInsets.all(25),
            child: Row(
              children: [
                Text(
                  "Home",
                  textScaler: TextScaler.linear(1.3),
                ),
                SizedBox(
                  width: 20,
                ),
                Icon(Icons.arrow_forward_sharp),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Forums",
                  textScaler: TextScaler.linear(1.3),
                ),
                SizedBox(
                  width: 20,
                ),
                Icon(Icons.arrow_forward_sharp),
                SizedBox(
                  width: 20,
                ),
                Text(
                  currentTopic.currentTopicName,
                  textScaler: TextScaler.linear(1.3),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Card(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: SearchBar(
                        hintText: "Search for a thread!",
                      ),
                    ),
                    SizedBox(width: 25),
                    FilledButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                Color.fromARGB(255, 244, 180, 68))),
                        onPressed: () {
                          updateParentIndex(6);
                        },
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Text("CREATE THREAD"),
                        ))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  indent: 15,
                  endIndent: 15,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Flexible(
                                  flex: 3,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    color:
                                        const Color.fromARGB(255, 137, 53, 255),
                                    child: ListTile(
                                      title:
                                          Center(child: Text('Sticky threads')),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    color:
                                        const Color.fromARGB(255, 137, 53, 255),
                                    child: ListTile(
                                      title: Center(child: Text("Latest Post")),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    color:
                                        const Color.fromARGB(255, 137, 53, 255),
                                    child: ListTile(
                                      title: Center(child: Text("Posts")),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    color:
                                        const Color.fromARGB(255, 137, 53, 255),
                                    child: ListTile(
                                      title: Center(child: Text("Replies")),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            isLoading
                                ? ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: threads!.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      var thread = threads[index];
                                      return Container(
                                        margin: EdgeInsets.all(10),
                                        child: Row(
                                          children: [
                                            Flexible(
                                              flex: 3,
                                              child: Card(
                                                color: const Color.fromARGB(
                                                    255, 68, 66, 66),
                                                child: SizedBox(
                                                  height: 65,
                                                  width: double.infinity,
                                                  child: FloatingActionButton(
                                                    backgroundColor:
                                                        Color.fromARGB(
                                                            255, 68, 66, 66),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                    onPressed: () {
                                                      updateParentIndex(5);
                                                    },
                                                    child: ListTile(
                                                      title: Text(
                                                        thread['name'] ?? '',
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                      subtitle: Text(
                                                        '${thread['posts'].length} Posts',
                                                        style: TextStyle(
                                                            color: Colors.grey),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Flexible(
                                              flex: 2,
                                              child: Card(
                                                color: const Color.fromARGB(
                                                    255, 68, 66, 66),
                                                child: SizedBox(
                                                  height: 65,
                                                  child: ListTile(
                                                    title: Text(
                                                        "2:01PM on 3/12/2024"),
                                                    subtitle: Text('By Ishaan'),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Flexible(
                                              child: Card(
                                                color: const Color.fromARGB(
                                                    255, 68, 66, 66),
                                                child: SizedBox(
                                                  height: 65,
                                                  child: ListTile(
                                                    title: Center(
                                                        child: Text("56")),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Flexible(
                                              child: Card(
                                                color: const Color.fromARGB(
                                                    255, 68, 66, 66),
                                                child: SizedBox(
                                                  height: 65,
                                                  child: ListTile(
                                                    title: Center(
                                                        child: Text("567")),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    })
                                : CircularProgressIndicator(),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
