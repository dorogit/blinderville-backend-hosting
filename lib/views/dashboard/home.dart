import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";

class Home extends HookWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final commentsCount = useState(5);
    return Center(
        child: Container(
      child: const Column(
        children: <Widget>[
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.question_answer),
                  title: Text(
                    'Question of the day',
                    textScaler: TextScaler.linear(1.5),
                  ),
                  subtitle: Text('When is your birthday?'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: SizedBox(
                        width: 600,
                        height: 50,
                        child: TextField(
                          decoration: InputDecoration(
                              suffixIcon: Icon(Icons.send),
                              labelText: 'Type something...',
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.question_answer),
                  title: Text(
                    "Johnson's wall",
                    textScaler: TextScaler.linear(1.5),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: SizedBox(
                        width: 600,
                        height: 50,
                        child: TextField(
                          decoration: InputDecoration(
                              suffixIcon: Icon(Icons.send),
                              labelText: 'Type something...',
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
