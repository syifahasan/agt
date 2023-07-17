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
      title: 'HomePage AGT',
      theme: ThemeData(
        fontFamily: 'SFProDisplay',
      ),
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
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: AppBar(
            elevation: 0,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(30)),
                  gradient: RadialGradient(
                    colors: [Colors.white, Color.fromARGB(255, 58, 57, 57)],
                    center: Alignment.topCenter,
                    radius: 10,
                  )),
            ),
            // backgroundColor: Colors.amber,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
            title: Row(
              children: [
                Expanded(
                  child: TextField(
                    textInputAction: TextInputAction.done,
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
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/other/bg.png'),
                fit: BoxFit.cover,
                scale: 2.0),
          ),
          child: ListView(
            children: [
              Center(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Positioned(
                          child: Container(
                            margin: EdgeInsets.only(top: 120),
                            padding: EdgeInsets.symmetric(
                                vertical: 70, horizontal: 20),
                            height: 500,
                            width: screenWidth,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            child: Wrap(
                              alignment: WrapAlignment.spaceEvenly,
                              runSpacing: 20,
                              spacing: screenWidth * 10 / 100,
                              children: [
                                Menu(screenWidth: screenWidth),
                                Menu(screenWidth: screenWidth),
                                Menu(screenWidth: screenWidth),
                                Menu(screenWidth: screenWidth),
                                Menu(screenWidth: screenWidth),
                                Menu(screenWidth: screenWidth),
                                Menu(screenWidth: screenWidth),
                                Menu(screenWidth: screenWidth),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 18,
                          child: Container(
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.only(top: 20),
                            height: 150,
                            width: 90 / 100 * screenWidth,
                            decoration: BoxDecoration(
                              // color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  offset: Offset(0, 5),
                                  blurRadius: 3,
                                  spreadRadius: 1,
                                )
                              ],
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 58, 57, 57),
                                  Colors.white
                                ],
                                begin: Alignment(0, -20),
                                end: Alignment(0, 2),
                              ),
                              borderRadius: BorderRadius.circular(30),
                              // border: Border.all(color: Colors.black, width: 2),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Hi, Username!",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text("AG Points"),
                                      Text(
                                        "Rp.250.000",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
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
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

class Menu extends StatelessWidget {
  const Menu({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: screenWidth * 20 / 100,
          height: screenWidth * 20 / 100,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(screenWidth * 50 / 100),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text("Tes"),
      ],
    );
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
        SizedBox(
          height: 10,
        ),
        Text(desc),
      ],
    );
  }
}
