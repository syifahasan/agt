import 'package:authentic_guards/utils/payment/topUpMethod.dart';
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
                  'TOP UP',
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
                padding: EdgeInsets.only(
                  top: 90,
                  left: 30,
                  right: 30,
                ),
                width: screenWidth,
                height: 900,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'How would you like to top up AGCoin Balance?',
                        style: TextStyle(
                          fontFamily: 'SFProDisplay',
                          color: Colors.black,
                          fontSize: screenWidth * 0.06,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 50,
                        bottom: 5,
                      ),
                      child: Text(
                        'MY SAVED CARDS',
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          color: Color(0xFF444444),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Container(
                      width: screenWidth * 90 / 100,
                      height: screenHeight * 10 / 100,
                      decoration: BoxDecoration(
                        color: Color(0xffEDEDED),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 14),
                                width: screenWidth * 16 / 100,
                                height: screenHeight * 5 / 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(11),
                                  border: Border.all(
                                    color: Color(0xff7D66FF),
                                    width: 2,
                                  ),
                                  color: Colors.white,
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: Color(0xff7D66FF),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 13, horizontal: 10),
                                width: 90,
                                // height: 80,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'New Cards',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                    Image.asset(
                                        'assets/icons/payment/visamaster.png'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_forward_ios_rounded,
                              ))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 6),
                      child: Text(
                        'BANK TRANSFER',
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          color: Color(0xFF444444),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    BankTransfer(
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      slug: 'BCA',
                      showImage: true,
                      img: 'assets/icons/payment/bca.png',
                      borad: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      showDivider: true,
                    ),
                    BankTransfer(
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      showImage: true,
                      slug: 'BNI',
                      img: 'assets/icons/payment/bni.png',
                      showDivider: true,
                    ),
                    BankTransfer(
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      showImage: true,
                      slug: 'Mandiri',
                      img: 'assets/icons/payment/mandiri.png',
                      showDivider: true,
                    ),
                    BankTransfer(
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      showImage: false,
                      slug: 'More',
                      title: 'See More Bank',
                      showDivider: false,
                      borad: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 6),
                      child: Text(
                        'OTHER',
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          color: Color(0xFF444444),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Container(
                      width: screenWidth * 90 / 100,
                      height: screenHeight * 8.5 / 100,
                      decoration: BoxDecoration(
                        color: Color(0xffEDEDED),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                width: screenWidth * 19 / 100,
                                height: screenHeight * 12 / 100,
                                // height: 80,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                        'assets/icons/payment/qris.png'),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        'QRIS Top Up',
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_forward_ios_rounded,
                              ))
                        ],
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

class BankTransfer extends StatelessWidget {
  const BankTransfer({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    this.img,
    required this.showDivider,
    required this.showImage,
    this.borad,
    this.title,
    this.slug,
  });

  final double screenWidth;
  final double screenHeight;
  final String? img;
  final BorderRadius? borad;
  final bool showDivider;
  final bool showImage;
  final String? title;
  final String? slug;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            print(slug);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return TopUpMethod(
                    slug: slug ?? '',
                  );
                },
              ),
            );
          },
          child: Container(
            width: screenWidth * 90 / 100,
            height: screenHeight * 8.5 / 100,
            decoration: BoxDecoration(
              color: Color(0xffEDEDED),
              borderRadius: borad,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    showImage
                        ? Container(
                            margin: EdgeInsets.only(left: 20),
                            width: screenWidth * 23 / 100,
                            height: screenHeight * 15 / 100,
                            child: Image.asset(img ?? ''),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              title ?? '',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return TopUpMethod(
                            slug: slug ?? '',
                          );
                        },
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios_rounded,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (showDivider)
          Divider(
            height: 1,
            thickness: 2,
            color: Colors.white,
          )
      ],
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
