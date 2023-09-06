import 'package:authentic_guards/pages/store/favoritePage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'itemDetails.dart';

class BestDealPage extends StatelessWidget {
  const BestDealPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isSaved = false;
    late String itempic;
    late String price;
    late String itemname;
    late List<Color> colors;

    void itemDetails(
        String image, String harga, String name, List<Color> warna) {
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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        elevation: 5,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black, size: w * 0.065),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.vertical(bottom: Radius.circular(w * 0.05)),
            gradient: RadialGradient(
              colors: [Colors.white, Color.fromARGB(255, 58, 57, 57)],
              center: Alignment.topCenter,
              radius: w * 0.055,
            ),
          ),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(w * 0.1),
        )),
        title: Text(
          "Best Deal",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: w * 0.045,
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: w * 0.025),
            child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset('assets/icons/navbar/Cart.svg')),
          )
        ],
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 15),
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Wrap(
                        runSpacing: 18,
                        spacing: 10 / 100 * screenWidth,
                        alignment: WrapAlignment.spaceEvenly,
                        children: [
                          Items(
                            colors: [Colors.black, Colors.white],
                            screenWidth: screenWidth,
                            itempic:
                                'assets/icons/store/fashionsImages/tshirt.png',
                            itemname: 'BUTTERFLY T-SHIRT',
                            price: '524.399.68',
                            tag: 'Fashion',
                            isSaved: isSaved,
                            onPressed: (p0, p1, p2, p3) {
                              itemDetails(p0, p1, p2, p3);
                            },
                          ),
                          Items(
                            colors: [Colors.black, Colors.white],
                            screenWidth: screenWidth,
                            itempic:
                                'assets/icons/store/fashionsImages/butterflyhoodie.png',
                            itemname: 'BUTTERFLY HOODIE',
                            price: '870.000.00',
                            tag: 'Fashion',
                            isSaved: isSaved,
                            onPressed: (p0, p1, p2, p3) {
                              itemDetails(p0, p1, p2, p3);
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25, left: 15),
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Wrap(
                        runSpacing: 18,
                        spacing: 10 / 100 * screenWidth,
                        alignment: WrapAlignment.spaceEvenly,
                        children: [
                          Items(
                            colors: [Colors.black, Colors.white],
                            screenWidth: screenWidth,
                            itempic:
                                'assets/icons/store/fashionsImages/tshirt.png',
                            itemname: 'BUTTERFLY T-SHIRT',
                            price: '599.999.99',
                            tag: 'Fashion',
                            isSaved: isSaved,
                            onPressed: (p0, p1, p2, p3) {
                              itemDetails(p0, p1, p2, p3);
                            },
                          ),
                          Items(
                            colors: [Colors.black, Colors.white],
                            screenWidth: screenWidth,
                            itempic:
                                'assets/icons/store/fashionsImages/butterflyhoodie.png',
                            itemname: 'BUTTERFLY HOODIE',
                            price: '899.999.99',
                            tag: 'Fashion',
                            isSaved: isSaved,
                            onPressed: (p0, p1, p2, p3) {
                              itemDetails(p0, p1, p2, p3);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25, left: 15),
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Wrap(
                        runSpacing: 18,
                        spacing: 10 / 100 * screenWidth,
                        alignment: WrapAlignment.spaceEvenly,
                        children: [
                          Items(
                            colors: [Colors.black, Colors.white],
                            screenWidth: screenWidth,
                            itempic:
                                'assets/icons/store/fashionsImages/tshirt.png',
                            itemname: 'BUTTERFLY T-SHIRT',
                            price: '599.999.99',
                            tag: 'Fashion',
                            isSaved: isSaved,
                            onPressed: (p0, p1, p2, p3) {
                              itemDetails(p0, p1, p2, p3);
                            },
                          ),
                          Items(
                            colors: [Colors.black, Colors.white],
                            screenWidth: screenWidth,
                            itempic:
                                'assets/icons/store/fashionsImages/butterflyhoodie.png',
                            itemname: 'BUTTERFLY HOODIE',
                            price: '899.999.99',
                            tag: 'Fashion',
                            isSaved: isSaved,
                            onPressed: (p0, p1, p2, p3) {
                              itemDetails(p0, p1, p2, p3);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 200,
              )
            ],
          )
        ],
      ),
    );
  }
}

class Items extends StatefulWidget {
  Items({
    super.key,
    required this.screenWidth,
    required this.itempic,
    required this.itemname,
    required this.price,
    required this.tag,
    required this.isSaved,
    required this.onPressed,
    required this.colors,
  });

  final double screenWidth;
  final String itempic;
  final String tag;
  final String price;
  final String itemname;
  final bool isSaved;
  final List<Color> colors;
  final Function(String, String, String, List<Color>) onPressed;

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
    return Container(
      width: widget.screenWidth * 40 / 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              GestureDetector(
                onTap: () {
                  widget.onPressed(widget.itempic, widget.price,
                      widget.itemname, widget.colors);
                },
                child: Container(
                  width: widget.screenWidth * 43 / 100,
                  height: widget.screenWidth * 55 / 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(widget.itempic), fit: BoxFit.fill),
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
                  width: widget.screenWidth * 11 / 100,
                  height: widget.screenWidth * 11 / 100,
                  decoration: BoxDecoration(
                      color: containerColor,
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(10))),
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
            child: Text(widget.tag),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: RichText(
              text: TextSpan(
                text: widget.itemname,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'SFProDisplay',
                  fontWeight: FontWeight.bold,
                  fontSize: widget.screenWidth * 4 / 100,
                ),
              ),
            ),
          ),
          RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: <InlineSpan>[
                TextSpan(
                  text: 'RP. ${widget.price}',
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    fontSize: 10,
                  ),
                ),
                WidgetSpan(
                  child:
                      SizedBox(width: 20), // Tambahkan jarak horizontal di sini
                ),
                TextSpan(
                    text: 'RP. 399.999.99',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 10,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
