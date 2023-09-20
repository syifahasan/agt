import 'package:authentic_guards/pages/profile/editProfile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'store.dart';
import 'itemDetails.dart';
import 'package:authentic_guards/utils/provider/cartProvider.dart';
import 'package:provider/provider.dart';
import 'myCart.dart';
import 'package:authentic_guards/utils/payment/currencyFormat.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isSaved = false;
    late String itempic;
    late double price;
    late String itemname;
    late List<Color> colors;

    void itemDetails(
        String image, double harga, String name, List<Color> warna) {
      itempic = image;
      price = harga;
      itemname = name;
      colors = warna;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ItemDetailPage(
            itempic: itempic,
            price: price,
            itemname: itemname,
            colors: colors,
          ),
        ),
      );
    }

    final mediaQueryData = MediaQuery.of(context);
    final w = mediaQueryData.size.width;
    final h = mediaQueryData.size.height;
    final screenWidth = mediaQueryData.size.width;
    final screenHeight = mediaQueryData.size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
            iconTheme: IconThemeData(
              size: w * 0.065,
              color: Colors.white,
            ),
            backgroundColor: Colors.transparent,
            expandedHeight: w * 0.25,
            pinned: false,
            flexibleSpace: Container(
              margin: EdgeInsets.only(top: w * 0.2, left: w * 0.12),
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Container(
                child: Text(
                  'MY FAVORITE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: w * 0.08,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ClipPath(
              clipper: MyClipPath(),
              child: Container(
                padding: EdgeInsets.only(
                  top: 90,
                ),
                width: screenWidth,
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Consumer<CartProvider>(
                          builder: (context, cartProvider, child) {
                            final savedItems = cartProvider.saved;
                            if (savedItems.isEmpty) {
                              return Center(
                                child: Text(
                                  'No favorite item selected',
                                ),
                              );
                            }
                            return Items(
                              isSaved: false,
                              screenWidth: screenWidth,
                              savedItems: savedItems,
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Items extends StatefulWidget {
  Items({
    super.key,
    required this.savedItems,
    required this.isSaved,
    required this.screenWidth,
  });

  final List<SavedItems> savedItems;
  final double screenWidth;
  // final String itempic;
  // final String tag;
  // final double price;
  // final String itemname;
  final bool isSaved;
  // final List<Color> colors;
  // final Function(String, double, String, List<Color>) onPressed;

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  late bool isSaved;

  @override
  void initState() {
    super.initState();
    isSaved = widget.isSaved;
  }

  @override
  Widget build(BuildContext context) {
    Color containerColor = isSaved ? Color(0xffFFCE00) : Colors.grey;
    IconData iconData =
        isSaved ? Icons.bookmark : Icons.bookmark_border_outlined;
    return Column(
      children: [
        for (var savedItem in widget.savedItems)
          Container(
            width: widget.screenWidth * 40 / 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // widget.onPressed(widget.itempic, widget.price,
                        //     widget.itemname, widget.colors);
                      },
                      child: Container(
                        width: widget.screenWidth * 30 / 100,
                        height: widget.screenWidth * 40 / 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(savedItem.itempic),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.transparent,
                          border: null,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                // blurStyle: BlurStyle.outer,
                                blurRadius: 1,
                                offset: Offset(0, 0)),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        width: widget.screenWidth * 10 / 100,
                        height: widget.screenWidth * 10 / 100,
                        decoration: BoxDecoration(
                            color: containerColor,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10))),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              isSaved = !isSaved;
                            });
                            // widget.onPressed();
                          },
                          icon: Icon(
                            iconData,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6, bottom: 6),
                  child: Text('Fashions'),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: RichText(
                    text: TextSpan(
                      text: savedItem.itemname,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'SFProDisplay',
                        fontWeight: FontWeight.bold,
                        fontSize: widget.screenWidth * 3.5 / 100,
                      ),
                    ),
                  ),
                ),
                Text(
                  CurrencyFormat.convertToIdr(savedItem.price, 2),
                  style: TextStyle(fontSize: widget.screenWidth * 3.5 / 100),
                ),
              ],
            ),
          ),
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
