import 'package:blinderville/api/forums/threads_api.dart';
import 'package:blinderville/controller/forum/forum.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CreateThread extends HookConsumerWidget {
  const CreateThread({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    final currentTopic = ref.watch(currentTopicProvider);

    void submitThread() async {
      String title = titleController.text;
      String description = descriptionController.text;

      final test = await ThreadsAPI.postThread(currentTopic.currentTopicId,
          title, description, "65e1de6457cc231714ee711c");
      print(test);

      print('Title: $title');
      print('Description: $description');
    }

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
                  controller: titleController,
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
                height: 325,
                child: TextField(
                  controller: descriptionController,
                  style: TextStyle(fontSize: 12),
                  maxLines: 14,
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
                  backgroundColor: Color.fromARGB(255, 120, 67, 255),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () {
                    submitThread();
                  },
                  child: Text("Post"),
                ),
              ),
            ],
          ),
        )),
      ],
    );
  }
}
