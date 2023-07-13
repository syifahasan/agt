import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile Picture with Search Bar',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBar(
          elevation: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Color.fromARGB(255, 119, 114, 114), Colors.white]),
            ),
          ),
          backgroundColor: Colors.amber,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          title: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    prefix: Icon(Icons.search, color: Colors.grey, size: 20, ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(50)),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Search',
                  ),
                  onSubmitted: (value) {
                    // Perform search based on the input value
                    print('Search query: $value');
                  },
                ),
              ),
              SizedBox(width: 10.0),
              CircleAvatar(
                radius: 20.0,
                backgroundImage:
                    NetworkImage('https://picsum.photos/200/300?grayscale'),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Text('Profile Picture with Search Bar'),
      ),
    );
  }
}
