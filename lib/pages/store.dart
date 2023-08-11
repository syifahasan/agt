import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _searchController = TextEditingController();
    final mediaQueryData = MediaQuery.of(context);
    final screenWidth = mediaQueryData.size.width;
    final screenHeight = mediaQueryData.size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(85.0),
        child: AppBar(
          toolbarHeight: 83,
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
                  margin: EdgeInsets.only(top: 15, right: 20),
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
                  height: 35,
                  child: TextField(
                    textInputAction: TextInputAction.done,
                    controller: _searchController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child:
                            SvgPicture.asset('assets/icons/navbar/Search.svg'),
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(50)),
                      filled: true,
                      fillColor: Color(0xffD9D9D9),
                      hintText: 'Type something to search ...',
                      hintStyle: TextStyle(fontSize: 12),
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
              Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                    color: Color(0xffD9D9D9),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        offset: Offset(0, 2),
                        blurRadius: 3,
                        spreadRadius: 1,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(30)),
                margin: EdgeInsets.only(top: 13, right: 10),
                padding: EdgeInsets.all(5),
                child: Container(
                  child: SvgPicture.asset('assets/icons/navbar/Cart.svg'),
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(
            decelerationRate: ScrollDecelerationRate.fast),
        children: [
          Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                      child: Text(
                        'Select Category',
                        style: TextStyle(
                          fontSize: screenWidth * 5 / 100,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Wrap(
                        alignment: WrapAlignment.spaceEvenly,
                        runSpacing: 20,
                        spacing: screenWidth * 7 / 100,
                        children: [
                          Categories(
                            screenWidth: screenWidth,
                            image: 'assets/icons/agtlogo.png',
                            desc: 'Best Deal',
                          ),
                          Categories(
                            screenWidth: screenWidth,
                            image: 'assets/icons/agtlogo.png',
                            desc: 'Blast Sale',
                          ),
                          Categories(
                            screenWidth: screenWidth,
                            image: 'assets/icons/agtlogo.png',
                            desc: 'Fashion',
                          ),
                          Categories(
                            screenWidth: screenWidth,
                            image: 'assets/icons/agtlogo.png',
                            desc: 'Cosmetics',
                          ),
                          Categories(
                            screenWidth: screenWidth,
                            image: 'assets/icons/agtlogo.png',
                            desc: 'Electronics',
                          ),
                          Categories(
                            screenWidth: screenWidth,
                            image: 'assets/icons/agtlogo.png',
                            desc: 'Vaporizer',
                          ),
                          Categories(
                            screenWidth: screenWidth,
                            image: 'assets/icons/agtlogo.png',
                            desc: 'Services',
                          ),
                          Categories(
                            screenWidth: screenWidth,
                            image: 'assets/icons/agtlogo.png',
                            desc: 'View All',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 20, top: 25, bottom: 10),
                      child: Text(
                        'Hot Sales',
                        style: TextStyle(
                          fontSize: screenWidth * 5 / 100,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: screenWidth * 90 / 100,
                  height: screenHeight * 22 / 100,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(25)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 20, top: 35, bottom: 10),
                      child: Text(
                        'Best Seller',
                        style: TextStyle(
                          fontSize: screenWidth * 5 / 100,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Wrap(
                        runSpacing: 20,
                        spacing: screenWidth * 7 / 100,
                        alignment: WrapAlignment.spaceEvenly,
                        children: [
                          Items(screenWidth: screenWidth),
                          Items(screenWidth: screenWidth),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Items extends StatelessWidget {
  const Items({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth * 43 / 100,
      height: screenWidth * 55 / 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.transparent,
        border: null,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurStyle: BlurStyle.outer,
            blurRadius: 2,
          ),
        ],
      ),
    );
  }
}

class Categories extends StatelessWidget {
  const Categories({
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
    return Container(
      width: screenWidth * 16 / 100,
      child: Column(
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
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: desc,
              style: TextStyle(
                fontSize: screenWidth * 0.03,
                color: Colors.black,
                fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
