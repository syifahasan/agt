import 'package:flutter/material.dart';

class TopUpPage extends StatelessWidget {
  const TopUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final screenWidth = mediaQueryData.size.width;
    final screenHeight = mediaQueryData.size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.transparent,
            // Properties for the AppBar
            expandedHeight:
                screenHeight * 15 / 100, // Set the desired height of the AppBar
            pinned: false, // Set this to false to make AppBar non-sticky
            flexibleSpace: Container(
              margin: EdgeInsets.only(top: 100, left: 30),
              height: screenHeight * 20 / 100,
              // A container for the flexible space (background) of the AppBar
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Container(
                padding: EdgeInsets.only(),
                child: Text(
                  'Top Up',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.09,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          // SliverList to contain the scrollable content
          SliverToBoxAdapter(
            child: ClipPath(
              clipper: MyClipPath(),
              child: Container(
                width: screenWidth,
                height: 900,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 90.0,
                        left: 30,
                        right: 30,
                        bottom: 40,
                      ),
                      child: RichText(
                        text: TextSpan(
                          text: 'How would you like to top up AGCoin Balance?',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: screenWidth * 0.065,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        'MY SAVED CARDS',
                        style: TextStyle(
                          fontSize: screenWidth * 0.045,
                          color: Colors.grey[500],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
