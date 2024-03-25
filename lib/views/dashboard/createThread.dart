import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CreateThread extends HookConsumerWidget {
  const CreateThread({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                Text(
                  'Create a Thread!',
                  textScaler: TextScaler.linear(1.9),
                  style: TextStyle(color: Color.fromARGB(255, 120, 67, 255)),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Join the discussion'),
                  ],
                ),
              ],
            ),
          ),
        ),
        Card(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                height: 75,
                child: TextField(
                  style: TextStyle(fontSize: 12),
                  maxLines: 3,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    hintStyle: TextStyle(fontSize: 12),
                    hintText: "Thread title",
                  ),
                ),
              ),
              SizedBox(height: 25),
              Divider(indent: 20, endIndent: 20),
              SizedBox(height: 25),
              SizedBox(
                height: 100,
                child: TextField(
                  style: TextStyle(fontSize: 12),
                  maxLines: 3,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    hintStyle: TextStyle(fontSize: 12),
                    hintText: "Thread description",
                  ),
                ),
              ),
            ],
          ),
        )),
      ],
    );
  }
}
