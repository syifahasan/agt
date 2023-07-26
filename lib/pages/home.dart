import 'package:authentic_guards/pages/balanceCheck.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final screenWidth = mediaQueryData.size.width;
    final screenHeight = mediaQueryData.size.height;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: AppBar(
            leading: null,
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
                  child: Container(
                    margin: EdgeInsets.only(top: 20, right: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: Offset(0, 4),
                          blurRadius: 3,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    width: screenWidth * 50 / 100,
                    height: 30,
                    child: TextField(
                      textInputAction: TextInputAction.done,
                      controller: _searchController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        prefixIcon: Icon(Icons.search),
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
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      offset: Offset(0, 2),
                      blurRadius: 3,
                      spreadRadius: 1,
                    ),
                  ], borderRadius: BorderRadius.circular(30)),
                  margin: EdgeInsets.only(top: 10),
                  child: CircleAvatar(
                    radius: 20.0,
                    backgroundImage:
                        NetworkImage('https://picsum.photos/200/300?grayscale'),
                  ),
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
            physics: BouncingScrollPhysics(),
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      Positioned(
                        child: Container(
                          margin: EdgeInsets.only(top: 90),
                          padding:
                              EdgeInsets.symmetric(vertical: 50, horizontal: 0),
                          // height: 500,
                          width: screenWidth,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Wrap(
                                  alignment: WrapAlignment.spaceEvenly,
                                  runSpacing: 20,
                                  spacing: screenWidth * 7 / 100,
                                  children: [
                                    Menu(
                                        screenWidth: screenWidth,
                                        image:
                                            'assets/icons/news-svgrepo-com.png',
                                        desc: 'AuthenticNews'),
                                    Menu(
                                        screenWidth: screenWidth,
                                        image: 'assets/icons/LogoAGT.png',
                                        desc: 'AuthenticStore'),
                                    Menu(
                                        screenWidth: screenWidth,
                                        image:
                                            'assets/icons/smartphone-svgrepo-com.png',
                                        desc: 'Pulsa'),
                                    Menu(
                                        screenWidth: screenWidth,
                                        image:
                                            'assets/icons/plugin-svgrepo-com.png',
                                        desc: 'PLN'),
                                    Menu(
                                        screenWidth: screenWidth,
                                        image:
                                            'assets/icons/water-svgrepo-com.png',
                                        desc: 'PDAM'),
                                    Menu(
                                        screenWidth: screenWidth,
                                        image:
                                            'assets/icons/plane-svgrepo-com.png',
                                        desc: 'Tiket Pesawat'),
                                    Menu(
                                        screenWidth: screenWidth,
                                        image:
                                            'assets/icons/train-svgrepo-com.png',
                                        desc: 'Tiket Kereta Api'),
                                    Menu(
                                        screenWidth: screenWidth,
                                        image:
                                            'assets/icons/stack-svgrepo-com.png',
                                        desc: 'View All'),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  "News Update",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),

                              // MENU NEWS UPDATE
                              SingleChildScrollView(
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      width: screenWidth * 85 / 100,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      width: screenWidth * 85 / 100,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      width: screenWidth * 85 / 100,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  "Hot Sales",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),

                              // MENU HOT SALES
                              SingleChildScrollView(
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      width: screenWidth * 85 / 100,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      width: screenWidth * 85 / 100,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      width: screenWidth * 85 / 100,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
                          height: screenHeight * 12 / 100,
                          width: 90 / 100 * screenWidth,
                          decoration: BoxDecoration(
                            // color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                offset: Offset(0, 5),
                                blurRadius: 3,
                                spreadRadius: 1,
                              ),
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
                              Container(
                                width: screenWidth * 15 / 100,
                                height: screenWidth * 15 / 100,
                                decoration: BoxDecoration(
                                    gradient: RadialGradient(
                                      colors: [
                                        Colors.white,
                                        Color.fromARGB(255, 14, 13, 13)
                                      ],
                                      center: Alignment.bottomCenter,
                                      radius: 4,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        offset: Offset(0, 5),
                                        blurRadius: 3,
                                        spreadRadius: 1,
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(35)),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      print("Button Tapped");
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              BalanceCheckPage(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.2),
                                              offset: Offset(0, 5),
                                              blurRadius: 3,
                                              spreadRadius: 1,
                                            ),
                                          ]),
                                      child: CircleAvatar(
                                        radius: 30.0,
                                        backgroundImage: AssetImage(
                                            'assets/icons/LogoAGT.png'),
                                      ),
                                    ),
                                  ),
                                ),
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
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text("AG Points"),
                                    Text(
                                      "Rp.250.000",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text("Active"),
                                  ],
                                ),
                              ),
                              ActionButtons(
                                icon: 'assets/icons/add-svgrepo-com.svg',
                                desc: "Add",
                              ),
                              ActionButtons(
                                icon:
                                    'assets/icons/arrow-top-3-svgrepo-com.svg',
                                desc: "Pay",
                              ),
                              ActionButtons(
                                icon: 'assets/icons/discovery-svgrepo-com.svg',
                                desc: "Discover",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
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
    required this.image,
    required this.desc,
  });

  final double screenWidth;
  final String image;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: screenWidth * 16 / 100,
          height: screenWidth * 16 / 100,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
            ),
            color: Colors.black,
            borderRadius: BorderRadius.circular(screenWidth * 50 / 100),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: Offset(0, 5),
                blurRadius: 3,
                spreadRadius: 1,
              ),
            ],
          ),
          // child: SvgPicture.asset(
          //   image,
          //   width: 200,
          //   height: 200,
          // ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          desc,
          style: TextStyle(
            fontSize: 9.5,
          ),
        ),
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

  String icon;
  String desc;

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final screenWidth = mediaQueryData.size.width;
    final screenHeight = mediaQueryData.size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: screenWidth * 12 / 100,
          height: screenWidth * 12 / 100,
          decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [Colors.white, Color.fromARGB(255, 14, 13, 13)],
                center: Alignment.bottomCenter,
                radius: 6,
              ),
              borderRadius: BorderRadius.circular(10)),
          child: SvgPicture.asset(icon),
        ),
        SizedBox(
          height: 10,
        ),
        Text(desc),
      ],
    );
  }
}
