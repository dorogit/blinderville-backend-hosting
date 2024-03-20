import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Profile(),
  ));
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 30),
              SearchBar(
                hintText: "Search for Users!",
              ),
              HorizontalListView('Most Viewed', [
                'Veronica J.',
                'Jessica W.',
                'James A.',
                'Joon P.',
                'Ishaan J.',
                'John S.',
                'Speed S.',
                'Sean P.',
                'Elissa W.',
                'Quinton D.'
              ]),
              HorizontalListView('Currently Logged In', [
                'Alice A.',
                'Bob B.',
                'Charlie C.',
                'David D.',
                'Elena E.',
                'Charlie C.',
                'Charlie C.',
                'Charlie C.',
              ]),
              HorizontalListView('Newest Members', [
                'Fiona F.',
                'George G.',
                'Hannah H.',
                'Ivan I.',
                'Julia J.',
                'Charlie C.',
                'Charlie C.',
              ]),
              Column(
                children: [
                  SizedBox(height: 20),
                  Text('Premium Search',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 10),
                      // Adding dropdowns for filtering
                      FilterDropdown(
                          label: 'Age',
                          options: ['18-25', '26-35', '36-50', '50+']),
                      FilterDropdown(
                          label: 'Political Views',
                          options: ['Liberal', 'Conservative', 'Moderate']),
                      FilterDropdown(
                          label: 'Gender',
                          options: ['Male', 'Female', 'Other']),
                      FilterDropdown(
                          label: 'Height',
                          options: ['Short', 'Average', 'Tall']),
                      FilterDropdown(
                          label: 'Weight',
                          options: ['Underweight', 'Normal', 'Overweight']),
                    ],
                  ),
                ],
              ),
              HorizontalListView(null, [
                'Kevin K.',
                'Linda L.',
                'Michael M.',
                'Nancy N.',
                'Oliver O.',
                'Charlie C.',
                'Charlie C.',
              ])
            ],
          ),
        ),
      ),
    );
  }
}

Widget HorizontalListView(String? title, List items) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SizedBox(height: 20),
      title == null
          ? Container()
          : Text(title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
      SizedBox(height: 20),
      SizedBox(
        height: 330,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
          child: Scrollbar(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(15),
              itemCount: items.length,
              itemBuilder: (context, index) {
                String item = items[index];
                return Card(
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
                            'https://cdn.discordapp.com/attachments/1012398048745373697/1219945338719178852/brooke-cagle-pJqfhKUpCh8-unsplash.jpg?ex=660d25a2&is=65fab0a2&hm=0cf4487ff728707deedb3429e0b1b978110cdcb64fff17c1c77d9b115fda90a7&',
                            fit: BoxFit.fill,
                            height: 300,
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              color: Colors.grey.withOpacity(0.1),
                              alignment: Alignment.center,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    item,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        icon: Icon(Icons.star_border),
                                        onPressed: () {},
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.favorite),
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    ],
  );
}

class SearchBar extends StatelessWidget {
  final String? hintText;

  const SearchBar({super.key, this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}

class FilterDropdown extends StatefulWidget {
  final String label;
  final List<String> options;

  const FilterDropdown({super.key, required this.label, required this.options});

  @override
  _FilterDropdownState createState() => _FilterDropdownState();
}

class _FilterDropdownState extends State<FilterDropdown> {
  String? _selectedOption;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('${widget.label}: '),
          SizedBox(width: 10),
          DropdownButton<String>(
            value: _selectedOption,
            onChanged: (String? newValue) {
              setState(() {
                _selectedOption = newValue;
              });
            },
            items: widget.options.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
