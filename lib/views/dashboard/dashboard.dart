import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Dashboard extends ConsumerWidget {
  Dashboard({super.key});
  int railIndex = 0;
  Map pages = {'home': const Icon(Icons.home)};
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blinderville'),
      ),
      body: Row(
        children: [
          NavigationRail(destinations: const [
            NavigationRailDestination(
                icon: Icon(Icons.home), label: Text('Home')),
            NavigationRailDestination(
                icon: Icon(Icons.home), label: Text('Profile')),
          ], selectedIndex: railIndex)
        ],
      ),
    );
  }
}
