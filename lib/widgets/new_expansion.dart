import 'package:flutter/material.dart';

const List<String> list = <String>['One', 'Two', 'Three'];

class CustomExpansion extends StatefulWidget {
  const CustomExpansion({Key key}) : super(key: key);

  @override
  State<CustomExpansion> createState() => _CustomExpansionState();
}

class _CustomExpansionState extends State<CustomExpansion> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButton<String>(
          
          value: dropdownValue,
          icon: const Icon(Icons.arrow_downward),
          elevation: 16,
          style: const TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (String value) {
            // This is called when the user selects an item.
            setState(() {
              dropdownValue = value;
            });
          },
          items: list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        const ExpansionTile(
          title: Text('My Expansion'),
          children: [
            ListTile(
              title: Text(
                'Shoes',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              title: Text(
                'Shoes',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              title: Text(
                'Shoes',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              title: Text(
                'Shoes',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
