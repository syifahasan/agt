import 'package:authentic_guards/pages/notification.dart';
import 'package:flutter/material.dart';

class editProfile extends StatelessWidget {
  const editProfile({super.key});

  @override
  Widget build(BuildContext context) {
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
                padding: EdgeInsets.only(left: 40),
                decoration: BoxDecoration(color: Colors.black),
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
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 150,
                          left: 30,
                          right: 30,
                          bottom: 40,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                          ),
                          child: RichText(
                            text: TextSpan(
                              text:
                                  'How would you like to top up AGCoin Balance?',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.065,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
