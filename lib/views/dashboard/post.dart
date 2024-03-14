import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Post extends HookConsumerWidget {
  const Post({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                "Meetups and Events",
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
                "Devin",
                textScaler: TextScaler.linear(1.3),
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 20,
      ),
      SizedBox(
        height: 1200,
        child: ListView.builder(
            itemCount: 5,
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
                                          "Devin, the new A.I. software engineer is a SCAM!!!!!!",
                                          textScaler: TextScaler.linear(1.2)),
                                      trailing: IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.chat)),
                                    ),
                                    Divider(indent: 20, endIndent: 20),
                                    SizedBox(height: 10),
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
                                                              "Cognition A.I. recently released Devin, an A.I. 'software engineer'. Calling it a replacement for human engineers is a shame"),
                                                        )
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
      )
    ]);
  }
}
