import 'package:authentic_guards/utils/payment/topUpMethod.dart';
import 'package:flutter/material.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

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
                screenHeight * 20 / 100, // Set the desired height of the AppBar
            pinned: false, // Set this to false to make AppBar non-sticky
            flexibleSpace: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 100, left: 30),
                    height: screenHeight * 20 / 100,
                    // A container for the flexible space (background) of the AppBar
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                    child: Container(
                      padding: EdgeInsets.only(),
                      child: Row(
                        children: [
                          Text(
                            'MY CART',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth * 0.09,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: screenWidth * 0.10, right: screenWidth * 0.05),
                    child: IconFavorit(),
                  ),
                ],
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
                ),
                width: screenWidth,
                height: screenHeight,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Cart(),
                        Cart(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        height: screenWidth * 45 / 100,
        width: screenWidth,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Divider(
              indent: 20,
              endIndent: 20,
              thickness: 1.5,
            ),
            Container(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.08, right: screenWidth * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text('Total'),
                  ),
                  Container(
                    child: Text(
                      'Rp 524.223,68',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
            FloatingActionButton.extended(
              backgroundColor: Color(0xffFF6161),
              onPressed: () {},
              label: Container(
                width: screenWidth * 70 / 100,
                child: Center(
                  child: Text(
                    'Continue Payment',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  bool isChecked = false;

  void toggleCheckbox() {
    setState(() {
      isChecked = !isChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Transform.scale(
              scale: screenWidth * 0.0025,
              child: Checkbox(
                activeColor: Colors.black,
                value: isChecked,
                onChanged: (value) => toggleCheckbox(),
              ),
            ),
            Card(
              elevation: screenWidth * 0.02,
              child: Container(
                  width: screenWidth * 0.2,
                  height: screenWidth * 0.2,
                  child: Image.asset(
                      'assets/icons/store/fashionsImages/tshirt.png')),
            ),
            Container(
              width: screenWidth * 0.3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      'BUTTERFLY T-SHIRT',
                      style: TextStyle(
                          fontSize: screenWidth * 0.03,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                    child: Text(
                      'Garment Dyed T-shirt',
                      style: TextStyle(
                        fontSize: screenWidth * 0.023,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: screenWidth * 0.02,
                    ),
                    child: Text(
                      'Size: M',
                      style: TextStyle(
                          fontSize: screenWidth * 0.025,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
            IconCounter(),
          ],
        ),
      ],
    );
  }
}

class IconCounter extends StatefulWidget {
  const IconCounter({super.key});

  @override
  State<IconCounter> createState() => _IconCounterState();
}

class _IconCounterState extends State<IconCounter> {
  int counter = 0;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void decrementCounter() {
    setState(() {
      if (counter > 0) {
        counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth * 0.30,
      height: screenWidth * 0.08,
      decoration: BoxDecoration(
        // color: Colors.grey,
        borderRadius: BorderRadius.all(
          Radius.circular(screenWidth * 0.015),
        ),
        border: Border.all(
          color: Colors.black,
          width: 0.5,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.remove, size: screenWidth * 0.025),
            onPressed: decrementCounter,
          ),
          Text(
            '$counter',
            style: TextStyle(
              fontSize: screenWidth * 0.025,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            icon: Icon(Icons.add, size: screenWidth * 0.025),
            onPressed: incrementCounter,
          ),
        ],
      ),
    );
  }
}

class IconFavorit extends StatefulWidget {
  const IconFavorit({super.key});

  @override
  State<IconFavorit> createState() => _IconFavoritState();
}

class _IconFavoritState extends State<IconFavorit> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(top: 40),
      child: IconButton(
        icon: Icon(
          size: screenWidth * 0.1,
          isFavorite ? Icons.bookmark : Icons.bookmark_border,
          color: Colors.white,
        ),
        onPressed: toggleFavorite,
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
