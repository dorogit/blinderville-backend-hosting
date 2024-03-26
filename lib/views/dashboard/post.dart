import 'package:blinderville/api/forums/post_api.dart';
import 'package:blinderville/controller/forum/forum.dart';
import 'package:blinderville/controller/forum/threads.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Post extends HookConsumerWidget {
  final Function scrollToBottom;

  const Post({super.key, required this.scrollToBottom});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTopic = ref.watch(currentTopicProvider);
    final currentThreadsNotifier = threadsProvider(currentTopic.currentTopicId);

    final isLoading = ref.watch(
      currentThreadsNotifier.select((value) => value.isLoading),
    );
    final threads = ref.watch(
      currentThreadsNotifier.select((value) => value.threads),
    );

    final threadId = ref
        .watch(currentThreadsNotifier.select((value) => value.currentThreadId));

    final currentThread = threads?.firstWhere(
      (thread) => thread['_id'] == threadId,
    );
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();

    void submitPost() async {
      String title = titleController.text;
      String description = descriptionController.text;

      final test = await PostAPI.post(
          threadId, title, description, "65e1de6457cc231714ee711c", false);
      print(test);

      print('Title: $title');
      print('Description: $description');
    }

    return Column(children: [
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
              SizedBox(
                width: 20,
              ),
              Icon(Icons.arrow_forward_sharp),
              SizedBox(
                width: 20,
              ),
              Text(
                currentThread?['name'],
                textScaler: TextScaler.linear(1.3),
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 20,
      ),
      isLoading
          ? CircularProgressIndicator()
          : Card(
              color: Color.fromARGB(255, 109, 29, 249),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 28, 27, 30),
                          border: Border(
                            left: BorderSide(
                              color: Color.fromARGB(255, 244, 180, 68),
                              width: 5,
                            ),
                            bottom: BorderSide(
                              color: Color.fromARGB(255, 244, 180, 68),
                              width: 3,
                            ),
                          ),
                        ),
                        child: Column(
                          children: [
                            ListTile(
                              title: Text("Devin Hater"),
                              leading: CircleAvatar(
                                backgroundImage: AssetImage(
                                    'assets/images/profilePicture.jpg'),
                              ),
                              trailing: Icon(Icons.star),
                              subtitle: Text(
                                "Senior Member",
                                textScaler: TextScaler.linear(0.8),
                              ),
                            ),
                            Text("9:29 AM on 14-3-2024",
                                textScaler: TextScaler.linear(0.8)),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.comment),
                                    SizedBox(width: 5),
                                    Text("3.9k",
                                        textScaler: TextScaler.linear(0.85))
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.thumb_up),
                                    SizedBox(width: 5),
                                    Text("3.9k",
                                        textScaler: TextScaler.linear(0.85))
                                  ],
                                )
                              ],
                            ),
                            ListTile(
                              subtitle: Text(
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  "I have a deep disdain for cognitive, the new AI software engineer trend they're trying to create is for a crypto scam they want to achieve with enough turmoil!!!"),
                              isThreeLine: true,
                            ),
                            Divider(indent: 15, endIndent: 15),
                            SizedBox(height: 10),
                            SizedBox(
                              height: 215,
                              child: ListView.builder(
                                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  itemCount: 8,
                                  itemBuilder: (BuildContext context, index) {
                                    return Card(
                                      child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Text("Age: 32"),
                                      ),
                                    );
                                  }),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 25),
                    Expanded(
                      flex: 7,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 28, 27, 30),
                          border: Border(
                            left: BorderSide(
                              color: Color.fromARGB(255, 244, 180, 68),
                              width: 5,
                            ),
                            bottom: BorderSide(
                              color: Color.fromARGB(255, 244, 180, 68),
                              width: 3,
                            ),
                          ),
                        ),
                        child: SizedBox(
                          height: 400,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text(currentThread?['name'],
                                      textScaler: TextScaler.linear(1.2)),
                                  trailing: IconButton(
                                      onPressed: () {
                                        scrollToBottom();
                                      },
                                      icon: Icon(Icons.chat)),
                                ),
                                Divider(indent: 20, endIndent: 20),
                                SizedBox(height: 10),
                                Text(currentThread?['description']),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
      SizedBox(
        height: 1200,
        child: ListView.builder(
            itemCount: currentThread?['posts'].length,
            itemBuilder: (BuildContext context, index) {
              return Column(
                children: [
                  SizedBox(height: 20),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
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
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text("Devin Hater"),
                                    leading: CircleAvatar(
                                      backgroundImage: AssetImage(
                                          'assets/images/profilePicture.jpg'),
                                    ),
                                    trailing: Icon(Icons.star),
                                    subtitle: Text(
                                      "Senior Member",
                                      textScaler: TextScaler.linear(0.8),
                                    ),
                                  ),
                                  Text("9:29 AM on 14-3-2024",
                                      textScaler: TextScaler.linear(0.8)),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.comment),
                                          SizedBox(width: 5),
                                          Text("3.9k",
                                              textScaler:
                                                  TextScaler.linear(0.85))
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.thumb_up),
                                          SizedBox(width: 5),
                                          Text("3.9k",
                                              textScaler:
                                                  TextScaler.linear(0.85))
                                        ],
                                      )
                                    ],
                                  ),
                                  ListTile(
                                    subtitle: Text(
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        "I have a deep disdain for cognitive, the new AI software engineer trend they're trying to create is for a crypto scam they want to achieve with enough turmoil!!!"),
                                    isThreeLine: true,
                                  ),
                                  Divider(indent: 15, endIndent: 15),
                                  SizedBox(height: 10),
                                  SizedBox(
                                    height: 215,
                                    child: ListView.builder(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 0, 10, 0),
                                        itemCount: 8,
                                        itemBuilder:
                                            (BuildContext context, index) {
                                          return Card(
                                            child: Padding(
                                              padding: EdgeInsets.all(10),
                                              child: Text("Age: 32"),
                                            ),
                                          );
                                        }),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 25),
                          Expanded(
                            flex: 7,
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
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  children: [
                                    ListTile(
                                      title: Text(
                                          currentThread?['posts'][index]
                                              ['title'],
                                          textScaler: TextScaler.linear(1.2)),
                                      trailing: IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.chat)),
                                    ),
                                    Divider(indent: 20, endIndent: 20),
                                    SizedBox(height: 10),
                                    ListTile(
                                      title: Text(currentThread?['posts'][index]
                                          ['description']),
                                      trailing: IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.chat)),
                                    ),
                                    Container(
                                      alignment: FractionalOffset.centerLeft,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Color.fromARGB(255, 28, 27, 30),
                                        border: Border(
                                          left: BorderSide(
                                            color: Color.fromARGB(
                                                255, 109, 29, 249),
                                            width: 5,
                                          ),
                                          bottom: BorderSide(
                                            color: Color.fromARGB(
                                                255, 109, 29, 249),
                                            width: 3,
                                          ),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(child: Text("Replies")),
                                      ),
                                    ),
                                    SizedBox(
                                        height: 250,
                                        child: ListView.builder(
                                            itemCount: 3,
                                            itemBuilder:
                                                (BuildContext context, index) {
                                              return Card(
                                                child: Padding(
                                                    padding: EdgeInsets.all(20),
                                                    child: Column(
                                                      children: [
                                                        ListTile(
                                                          title: Text(
                                                              "Posted by: Ishaan Jain"),
                                                          subtitle: Text(
                                                              "Date: 666/66/6666"),
                                                          trailing: IconButton(
                                                              onPressed: () {},
                                                              icon: Icon(Icons
                                                                  .more_horiz_outlined)),
                                                        ),
                                                        Divider(
                                                            indent: 15,
                                                            endIndent: 15),
                                                        ListTile(
                                                            title: Text(
                                                                'This is a reply'))
                                                      ],
                                                    )),
                                              );
                                            }))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }),
      ),
      SizedBox(height: 25),
      Divider(indent: 50, endIndent: 50),
      SizedBox(height: 20),
      Center(
        child: Text(
          'POST A REPLY',
          textScaler: TextScaler.linear(1.6),
          style: TextStyle(color: Color.fromARGB(255, 120, 67, 255)),
        ),
      ),
      SizedBox(height: 20),
      Card(
        color: Color.fromARGB(255, 109, 29, 249),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 28, 27, 30),
                    border: Border(
                      left: BorderSide(
                        color: Color.fromARGB(255, 244, 180, 68),
                        width: 5,
                      ),
                      bottom: BorderSide(
                        color: Color.fromARGB(255, 244, 180, 68),
                        width: 3,
                      ),
                    ),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text("Devin Hater"),
                        leading: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/profilePicture.jpg'),
                        ),
                        trailing: Icon(Icons.star),
                        subtitle: Text(
                          "Senior Member",
                          textScaler: TextScaler.linear(0.8),
                        ),
                      ),
                      Text("9:29 AM on 14-3-2024",
                          textScaler: TextScaler.linear(0.8)),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.comment),
                              SizedBox(width: 5),
                              Text("3.9k", textScaler: TextScaler.linear(0.85))
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.thumb_up),
                              SizedBox(width: 5),
                              Text("3.9k", textScaler: TextScaler.linear(0.85))
                            ],
                          )
                        ],
                      ),
                      ListTile(
                        subtitle: Text(
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            "I have a deep disdain for cognitive, the new AI software engineer trend they're trying to create is for a crypto scam they want to achieve with enough turmoil!!!"),
                        isThreeLine: true,
                      ),
                      Divider(indent: 15, endIndent: 15),
                      SizedBox(height: 10),
                      SizedBox(
                        height: 215,
                        child: ListView.builder(
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            itemCount: 8,
                            itemBuilder: (BuildContext context, index) {
                              return Card(
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text("Age: 32"),
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(width: 25),
              Expanded(
                flex: 7,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 28, 27, 30),
                    border: Border(
                      left: BorderSide(
                        color: Color.fromARGB(255, 244, 180, 68),
                        width: 5,
                      ),
                      bottom: BorderSide(
                        color: Color.fromARGB(255, 244, 180, 68),
                        width: 3,
                      ),
                    ),
                  ),
                  child: SizedBox(
                    height: 420,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextField(
                            controller: titleController,
                            style: TextStyle(fontSize: 12),
                            maxLines: 1,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              filled: true,
                              hintStyle: TextStyle(fontSize: 12),
                              hintText: "Title",
                            ),
                          ),
                          SizedBox(height: 20),
                          Divider(indent: 20, endIndent: 20),
                          SizedBox(height: 20),
                          TextField(
                            controller: descriptionController,
                            style: TextStyle(fontSize: 12),
                            maxLines: 8,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              filled: true,
                              hintStyle: TextStyle(fontSize: 12),
                              hintText: "Description",
                            ),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.message),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.image),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.preview),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 40,
                            width: 100,
                            child: FloatingActionButton(
                              backgroundColor:
                                  Color.fromARGB(255, 120, 67, 255),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              onPressed: () {
                                submitPost();
                              },
                              child: Text("Post"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
