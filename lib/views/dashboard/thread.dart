import 'package:flutter/material.dart';

Widget Thread() {
  return (Column(
    children: [
      Card(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: const ListTile(
            leading: Icon(Icons.people),
            title: Text(
              "MEETUPS AND EVENTS",
              textScaler: TextScaler.linear(1.5),
            ),
            subtitle: Text("Meet other people"),
          ),
        ),
      ),
      SizedBox(
        height: 20,
      ),
      const Card(
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
            ],
          ),
        ),
      ),
      SizedBox(
        height: 20,
      ),
      Card(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SearchBar(
                    hintText: "Search for a thread!",
                    leading: Icon(Icons.search),
                  ),
                  FilledButton(
                      onPressed: () {},
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Text("POST"),
                      ))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                indent: 15,
                endIndent: 15,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            color: Color.fromARGB(255, 137, 53, 255),
                            child: ListTile(
                              title: Center(child: Text("Sticky Threads")),
                            ),
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: 10,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  margin: EdgeInsets.all(5),
                                  child: Card(
                                    color:
                                        const Color.fromARGB(255, 68, 66, 66),
                                    child: SizedBox(
                                      height: 65,
                                      child: ListTile(
                                        title: Text("This is a thread topic"),
                                        subtitle: Text('Ishaan on 3/12/2024'),
                                      ),
                                    ),
                                  ),
                                );
                              })
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            color: Color.fromARGB(255, 137, 53, 255),
                            child: ListTile(
                              title: Center(child: Text("Last post")),
                            ),
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: 10,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  margin: EdgeInsets.all(5),
                                  child: Card(
                                    color:
                                        const Color.fromARGB(255, 68, 66, 66),
                                    child: SizedBox(
                                      height: 65,
                                      child: ListTile(
                                        title: Text("2:01PM on 3/12/2024"),
                                        subtitle: Text('By Ishaan'),
                                      ),
                                    ),
                                  ),
                                );
                              })
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            color: Color.fromARGB(255, 137, 53, 255),
                            child: ListTile(
                              title: Center(child: Text("Replies")),
                            ),
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: 10,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  margin: EdgeInsets.all(5),
                                  child: Card(
                                    color:
                                        const Color.fromARGB(255, 68, 66, 66),
                                    child: SizedBox(
                                      height: 65,
                                      child: ListTile(
                                        title: Center(child: Text("56")),
                                      ),
                                    ),
                                  ),
                                );
                              })
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            color: Color.fromARGB(255, 137, 53, 255),
                            child: ListTile(
                              title: Center(child: Text("Views")),
                            ),
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: 10,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  margin: EdgeInsets.all(5),
                                  child: Card(
                                    color:
                                        const Color.fromARGB(255, 68, 66, 66),
                                    child: SizedBox(
                                      height: 65,
                                      child: ListTile(
                                        title: Center(child: Text("567")),
                                      ),
                                    ),
                                  ),
                                );
                              })
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )
    ],
  ));
}
