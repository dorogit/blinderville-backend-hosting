import 'package:blinderville/views/dashboard/home.dart';
import 'package:blinderville/views/dashboard/profile.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Dashboard extends ConsumerWidget {
  Dashboard({super.key});
  int pageIndex = 0;
  Map pages = {
    'home': Icons.home_rounded,
    'profile': Icons.person_2_rounded,
    'forums': Icons.group_rounded,
    'events': Icons.event_rounded,
    'notifications': Icons.notifications_rounded
  };
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
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
                                  children: pages.entries.map((e) => Padding(
                  padding: const EdgeInsets.fromLTRB(10,5,10,0),
                  child: IconButton(onPressed: () {}, icon: Icon(e.value),iconSize: 40,padding: EdgeInsets.fromLTRB(50, 0, 50,0),),
                )).toList(),
                                )
              ],
            ),
          ),
          // Pages
          [Home(),Profile()][pageIndex],
        ],
      ),
    );
  }
}
