import "dart:ui";

import "package:flutter/material.dart";

Widget Profile() {
  return Center(
    child: Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SearchBar(),
          HorizontalListView('Match users', ['']),
          HorizontalListView('Liked users', ['']),
          HorizontalListView('Unlocked users', [''])
        ],
      ),
    ),
  );
}

Widget HorizontalListView(String? title, List items) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      title == null ? Container() : Text(title,style: TextStyle(
                            
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          )),
      Container(
          height: 300,

          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) => Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: SizedBox(
                width: 200,
                height: 300,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        'https://i0.wp.com/www.flutterbeads.com/wp-content/uploads/2022/02/o-change-device-orientation-portrait-landscape.png?fit=950%2C500&ssl=1',
                        fit: BoxFit.fill,
                        // width: 200,
                        height: 300,
                      ),
                    ),
                    ClipRRect( // Clip it cleanly. 
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            color: Colors.grey.withOpacity(0.1),
                            alignment: Alignment.center,
                            child:Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Title',
                          style: TextStyle(
                            
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(Icons.favorite_border),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Icon(Icons.thumb_up_alt_outlined),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                          ),
                        ),),
                    ]),
              ))
          ))
    ],
  );
}
