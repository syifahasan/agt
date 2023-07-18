import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';



class HomePage extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final screenWidth = mediaQueryData.size.width;
    return Scaffold(
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
                      margin: EdgeInsets.only(top: 120),
                      padding:
                          EdgeInsets.symmetric(vertical: 70, horizontal: 0),
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
                              spacing: screenWidth * 3 / 100,
                              children: [
                                Menu(
                                    screenWidth: screenWidth,
                                    image: 'assets/icons/news-svgrepo-com.png',
                                    desc: 'AuthenticNews'),
                                Menu(
                                    screenWidth: screenWidth,
                                    image: 'assets/icons/news-svgrepo-com.png',
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
                                    image: 'assets/icons/water-svgrepo-com.png',
                                    desc: 'PDAM'),
                                Menu(
                                    screenWidth: screenWidth,
                                    image: 'assets/icons/plane-svgrepo-com.png',
                                    desc: 'Tiket Pesawat'),
                                Menu(
                                    screenWidth: screenWidth,
                                    image: 'assets/icons/train-svgrepo-com.png',
                                    desc: 'Tiket Kereta Api'),
                                Menu(
                                    screenWidth: screenWidth,
                                    image: 'assets/icons/stack-svgrepo-com.png',
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
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  width: screenWidth * 85 / 100,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  width: screenWidth * 85 / 100,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  width: screenWidth * 85 / 100,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          )
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
          width: screenWidth * 20 / 100,
          height: screenWidth * 20 / 100,
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
            fontSize: 12,
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
