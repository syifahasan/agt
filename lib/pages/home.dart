import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
    final mediaQueryData = MediaQuery.of(context);
    final screenWidth = mediaQueryData.size.width;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: AppBar(
            elevation: 0,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(30)),
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
                      prefix: Icon(
                        Icons.search,
                        color: Colors.grey,
                        size: 20,
                      ),
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
        body: ListView(
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.symmetric(vertical: 20),
                    height: 150,
                    width: 90 / 100 * screenWidth,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      // gradient:
                      //     LinearGradient(colors: [Colors.grey, Colors.white]),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          radius: 20.0,
                          backgroundImage: NetworkImage(
                              'https://picsum.photos/200/300?grayscale'),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Hi, Username!",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text("AG Points"),
                              Text("Rp.250000"),
                              Text("Active"),
                            ],
                          ),
                        ),
                        ActionButtons(
                          icon: Icons.add,
                          desc: "Add",
                        ),
                        ActionButtons(
                          icon: Icons.arrow_upward,
                          desc: "Pay",
                        ),
                        ActionButtons(
                          icon: Icons.map_outlined,
                          desc: "Discover",
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}

class ActionButtons extends StatelessWidget {
  ActionButtons({
    super.key,
    required this.icon,
    required this.desc,
  });

  IconData icon;
  String desc;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              border: Border.all(width: 2),
              borderRadius: BorderRadius.circular(10)),
          child: IconButton(onPressed: () {}, icon: Icon(icon), iconSize: 18),
        ),
        Text(desc),
      ],
    );
  }
}
