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
      )
    ],
  ));
}
