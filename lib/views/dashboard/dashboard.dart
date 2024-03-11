import 'package:blinderville/views/dashboard/home.dart';
import 'package:blinderville/views/dashboard/profile.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Dashboard extends ConsumerStatefulWidget {
  const Dashboard({super.key});

  @override
  ConsumerState<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<Dashboard> {
  int pageIndex = 0;

  List pages = [
    ['home', Icons.home_rounded],
    ['profile', Icons.person_2_rounded],
    ['forums', Icons.group_rounded],
    ['events', Icons.event_rounded],
    ['notifications', Icons.notifications_rounded]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
        Container(
      width: double.infinity,
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('blinderville'),
          ListView(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            children: pages.asMap().entries.map<Widget>((e) => Padding(
            padding: const EdgeInsets.fromLTRB(10,5,10,0),
            child: IconButton(onPressed: () {setState(() {
              pageIndex = e.key;
            });}, icon: Icon(e.value[1]),iconSize: 40,padding: EdgeInsets.fromLTRB(50, 0, 50,0),),
          )).toList(),
                          )
        ],
      ),
    ),
        // Pages
            
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      
                      
                      child: Column(children: [
                        SizedBox(
                            height: 250,
                            width: 200,
                            child: Card(
                              child: Column(
                                children: [
                                  const Text('Johnson Roy'),
                                  ElevatedButton(
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
                                  const Text('My follows, likes, matches'),
                                  ElevatedButton(
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
                                  const Text('My purchases'),
                                  ElevatedButton(
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
                                  ElevatedButton(
                                      onPressed: () {},
                                      child: const Text('Update ok'))
                                ],
                              ),
                            ))
                      ]),
                    ),
                    Flexible(child: [Home(), Profile()][pageIndex],
                    
                flex: 3,),
                    Flexible(
                      
                      
                      child: Column(children: [
                        SizedBox(
                            height: 500,
                            width: 200,
                            child: Card(
                              child: Column(
                                children: [
                                  Text('Upcoming events'),
                                  ElevatedButton(
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
                                  ElevatedButton(
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
                                  ElevatedButton(
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
