import 'package:flutter/material.dart';


class Coba extends StatefulWidget {
  @override
  _CobaState createState() => _CobaState();
}

class _CobaState extends State<Coba> {
  List<Item> items = [
    Item("Pilihan 1", "Deskripsi 1"),
    Item("Pilihan 2", "Deskripsi 2"),
    Item("Pilihan 3", "Deskripsi 3"),
  ];

  Item? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dropdown 2 Kolom')),
      body: Center(
        child: DropdownButton<Item>(
          hint: Text('Pilih Item'),
          value: selectedItem,
          items: items.map((Item item) {
            return DropdownMenuItem<Item>(
              value: item,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(item.title),
                  Text(item.description),
                ],
              ),
            );
          }).toList(),
          onChanged: (Item? newValue) {
            setState(() {
              selectedItem = newValue;
            });
          },
        ),
      ),
    );
  }
}

class Item {
  final String title;
  final String description;

  Item(this.title, this.description);
}
