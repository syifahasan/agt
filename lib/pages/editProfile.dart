import 'package:authentic_guards/pages/notification.dart';
import 'package:flutter/material.dart';

class editProfile extends StatelessWidget {
  const editProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    final appBarSize = AppBar().preferredSize.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(color: Colors.black),
                padding: EdgeInsets.only(top: 10, left: 40),
                child: Text(
                  'EDIT PROFILE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              ClipPath(
                clipper: MyClipPath(),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    // borderRadius: BorderRadius.vertical(
                    //   top: Radius.elliptical(200, 120),
                    // ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Positioned(
                        top: 0,
                        child: SafeArea(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: appBarSize,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 8,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          top: isKeyboard
                              ? 0
                              : MediaQuery.of(context).size.height * 0.2,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(color: Colors.white),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.12,
                                  ),
                                  Text("Welcome",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 40)),
                                  Text("he Gateway to everything authentic",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15)),
                                  SizedBox(height: 50),
                                ],
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              if (!isKeyboard) ...[
                Positioned(
                  top: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.1),
                    alignment: Alignment.center,
                    child: Image(
                      image: AssetImage('assets/other/logo.png'),
                      height: 165,
                      width: 165,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

class MyClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path = Path();
    path.moveTo(0, h); // Starting point (bottom-left corner)
    path.lineTo(0, 80); // Left side
    path.quadraticBezierTo(
        w * 0.5, 0, w, 80); // Top with quadratic Bezier curve
    path.lineTo(w, h); // Right side
    path.close(); // Complete the shape
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
