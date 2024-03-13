import 'package:blinderville/views/dashboard/events.dart';
import 'package:blinderville/views/dashboard/forums.dart';
import 'package:blinderville/views/dashboard/home.dart';
import 'package:blinderville/views/dashboard/profile.dart';
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
    ['forums', Icons.arrow_outward_rounded],
    ['events', Icons.event_rounded],
  ];

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
                    child: Image(image: AssetImage('assets/images/logo.png')),
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
                                  setState(() {
                                    pageIndex = e.key;
                                  });
                                },
                                icon: Icon(e.value[1]),
                                iconSize: 30,
                                padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                              ),
                            ))
                        .toList(),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.notifications))
                ],
              ),
            ),
            // Pages
            Divider(indent: 50, endIndent: 50),
            SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Column(children: [
                    SizedBox(
                        height: 300,
                        width: 200,
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
                    SizedBox(
                        height: 340,
                        width: 200,
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
                    SizedBox(
                        height: 250,
                        width: 200,
                        child: Card(
                          child: Column(
                            children: [
                              const Text('My purchases'),
                              FilledButton(
                                  onPressed: () {},
                                  child: const Text('Update ok'))
                            ],
                          ),
                        )),
                    SizedBox(
                        height: 250,
                        width: 200,
                        child: Card(
                          child: Column(
                            children: [
                              const Text('Highlights'),
                              FilledButton(
                                  onPressed: () {},
                                  child: const Text('Update ok'))
                            ],
                          ),
                        ))
                  ]),
                ),
                Flexible(
                  flex: 3,
                  child: [
                    Home(context),
                    Profile(),
                    Forums(),
                    Events(context),
                  ][pageIndex],
                ),
                Flexible(
                  child: Column(children: [
                    SizedBox(
                        height: 500,
                        width: 200,
                        child: Card(
                          child: Column(
                            children: [
                              Text('Upcoming events'),
                              FilledButton(
                                  onPressed: () {}, child: Text('Update ok'))
                            ],
                          ),
                        )),
                    SizedBox(
                        height: 250,
                        width: 200,
                        child: Card(
                          child: Column(
                            children: [
                              Text('Recent forum posts'),
                              FilledButton(
                                  onPressed: () {}, child: Text('Update ok'))
                            ],
                          ),
                        )),
                    SizedBox(
                        height: 250,
                        width: 200,
                        child: Card(
                          child: Column(
                            children: [
                              Text('My Purchases'),
                              FilledButton(
                                  onPressed: () {}, child: Text('Update ok'))
                            ],
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
