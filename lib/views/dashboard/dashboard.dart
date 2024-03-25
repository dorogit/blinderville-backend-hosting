import 'package:blinderville/views/dashboard/createThread.dart';
import 'package:blinderville/views/dashboard/events.dart';
import 'package:blinderville/views/dashboard/forums.dart';
import 'package:blinderville/views/dashboard/home.dart';
import 'package:blinderville/views/dashboard/post.dart';
import 'package:blinderville/views/dashboard/profile.dart';
import 'package:blinderville/views/thread.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Dashboard extends ConsumerStatefulWidget {
  const Dashboard({super.key});

  @override
  ConsumerState<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<Dashboard> {
  int pageIndex = 0;
  int? _selectedTabContent = 0;

  List pages = [
    ['home', Icons.home_rounded],
    ['profile', Icons.person_2_rounded],
    ['forums', Icons.chat_sharp],
    ['events', Icons.event_rounded],
  ];

  void updateIndex(int newIndex) {
    setState(() {
      pageIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image(image: AssetImage('assets/images/logo1.png')),
                  ),
                  ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: pages
                        .asMap()
                        .entries
                        .map<Widget>((e) => Padding(
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                              child: IconButton(
                                onPressed: () {
                                  updateIndex(e.key);
                                },
                                icon: Icon(e.value[1]),
                                iconSize: 30,
                                padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                              ),
                            ))
                        .toList(),
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.notifications)),
                      SizedBox(width: 30),
                      CircleAvatar(
                        maxRadius: 15,
                        backgroundImage:
                            AssetImage('assets/images/profilePicture.jpg'),
                      ),
                    ],
                  )
                ],
              ),
            ),
            // Pages
            Divider(indent: 60, endIndent: 60),
            SizedBox(height: 25),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Column(children: [
                    SizedBox(
                        height: 300,
                        width: 225,
                        child: Card(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              CircleAvatar(
                                maxRadius: 40,
                                backgroundImage: AssetImage(
                                    'assets/images/profilePicture.jpg'),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              const Text(
                                'Johnson Roy',
                              ),
                              SizedBox(height: 10),
                              SizedBox(
                                height: 100,
                                width: 160,
                                child: TextField(
                                  style: TextStyle(fontSize: 12),
                                  maxLines: 3,
                                  maxLength: 140,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    filled: true,
                                    hintStyle: TextStyle(fontSize: 12),
                                    hintText: "About me..",
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              FilledButton(
                                  onPressed: () {}, child: const Text('Update'))
                            ],
                          ),
                        )),
                    SizedBox(height: 25),
                    SizedBox(
                        height: 330,
                        width: 225,
                        child: Card(
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 10, 10, 0),
                                child: CupertinoSlidingSegmentedControl(
                                  backgroundColor:
                                      Color.fromARGB(255, 28, 27, 30),
                                  thumbColor: Color.fromARGB(255, 120, 67, 255),
                                  children: {
                                    0: Icon(Icons.favorite, size: 20),
                                    1: Icon(Icons.star, size: 20),
                                    2: Icon(Icons.people, size: 20)
                                  },
                                  onValueChanged: (int? newValue) {
                                    setState(() {
                                      _selectedTabContent = newValue;
                                    });
                                  },
                                  groupValue: _selectedTabContent,
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(5, 10, 0, 0),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: 5,
                                    padding: EdgeInsets.all(10),
                                    itemBuilder: (BuildContext context, index) {
                                      return ListTile(
                                        title: Text(
                                          '$_selectedTabContent Person',
                                          textScaler: TextScaler.linear(0.8),
                                        ),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/profilePicture.jpg'),
                                          maxRadius: 10,
                                        ),
                                        trailing: Icon(
                                          Icons.mail,
                                          size: 10,
                                        ),
                                      );
                                    },
                                  ))
                            ],
                          ),
                        )),
                    SizedBox(height: 25),
                    SizedBox(
                        height: 320,
                        width: 225,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Column(
                              children: [
                                const Text('My purchases'),
                                ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: 4,
                                  itemBuilder: (BuildContext context, index) {
                                    return ListTile(
                                      title: Text("Veronica K.",
                                          textScaler: TextScaler.linear(0.7)),
                                      subtitle: Text("Unlocked Profile",
                                          textScaler: TextScaler.linear(0.7)),
                                      leading: CircleAvatar(
                                        backgroundImage: AssetImage(
                                            'assets/images/profilePicture.jpg'),
                                        maxRadius: 15,
                                      ),
                                    );
                                  },
                                )
                              ],
                            ),
                          ),
                        )),
                  ]),
                ),
                Flexible(
                  flex: 3,
                  child: [
                    Home(context),
                    Profile(),
                    Forums(updateParentIndex: updateIndex),
                    Events(context),
                    Thread(updateParentIndex: updateIndex),
                    Post(),
                    CreateThread()
                  ][pageIndex],
                ),
                Flexible(
                  child: Column(children: [
                    SizedBox(
                        height: 400,
                        width: 225,
                        child: Card(
                          child: Column(
                            children: [
                              SizedBox(height: 20),
                              Text('Upcoming events',
                                  textScaler: TextScaler.linear(1.2)),
                              SizedBox(height: 10),
                              Divider(indent: 10, endIndent: 10),
                              SizedBox(height: 10),
                              SizedBox(
                                height: 270,
                                child: ListView.builder(
                                    itemCount: 10,
                                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                    itemBuilder: (BuildContext context, index) {
                                      return Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Color.fromARGB(
                                                  255, 28, 27, 30),
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
                                                padding: EdgeInsets.all(15),
                                                child: ListTile(
                                                  title: Text(
                                                      "Mike fell on a banana"),
                                                )),
                                          ),
                                          SizedBox(height: 20)
                                        ],
                                      );
                                    }),
                              )
                            ],
                          ),
                        )),
                    SizedBox(height: 25),
                    SizedBox(
                        height: 400,
                        width: 225,
                        child: Card(
                          child: Column(
                            children: [
                              SizedBox(height: 20),
                              Text('Recent Posts',
                                  textScaler: TextScaler.linear(1.2)),
                              SizedBox(height: 10),
                              Divider(indent: 10, endIndent: 10),
                              SizedBox(height: 10),
                              SizedBox(
                                height: 300,
                                child: ListView.builder(
                                    itemCount: 10,
                                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                    itemBuilder: (BuildContext context, index) {
                                      return Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Color.fromARGB(
                                                  255, 28, 27, 30),
                                              border: Border(
                                                left: BorderSide(
                                                    color: Color.fromARGB(
                                                        255, 109, 29, 249),
                                                    width: 5),
                                                bottom: BorderSide(
                                                    color: Color.fromARGB(
                                                        255, 109, 29, 249),
                                                    width: 3),
                                              ),
                                            ),
                                            child: Padding(
                                                padding: EdgeInsets.all(15),
                                                child: ListTile(
                                                  title: Text(
                                                      "Mike fell on a banana"),
                                                )),
                                          ),
                                          SizedBox(height: 20)
                                        ],
                                      );
                                    }),
                              )
                            ],
                          ),
                        )),
                    SizedBox(height: 25),
                    SizedBox(
                        height: 250,
                        width: 225,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 109, 29, 249),
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text("BLINDERBLING"),
                                  trailing: Icon(Icons.more_vert),
                                ),
                                Divider(indent: 10, endIndent: 10),
                                SizedBox(
                                  height: 150,
                                  child: ListView(
                                    children: [
                                      ListTile(
                                          title: Text("BB Earned"),
                                          trailing: Text("\$300")),
                                      ListTile(
                                          title: Text("BB Earned"),
                                          trailing: Text("\$300")),
                                      ListTile(
                                          title: Text("BB Earned"),
                                          trailing: Text("\$300")),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )),
                  ]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
