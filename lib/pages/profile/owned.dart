import 'package:flutter/material.dart';
import 'package:authentic_guards/pages/profile/appBar.dart';
import 'package:authentic_guards/pages/store/itemDetails.dart';
import 'package:authentic_guards/utils/payment/currencyFormat.dart';

class MyOwned extends StatefulWidget {
  const MyOwned({super.key});

  @override
  State<MyOwned> createState() => _MyOwnedState();
}

class _MyOwnedState extends State<MyOwned> {
  bool isSaved = false;
  late String itempic;
  late double price;
  late String itemname;
  late List<Color> colors;

  void toggleSave() {
    print('saved');
  }

  void itemDetails(String image, double harga, String name, List<Color> warna) {
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

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(title: 'My Owned'),
      body: ListView(
        children: [
          Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(w * 0.085),
                    child: Text(
                      'My Product',
                      style: TextStyle(
                          fontSize: w * 0.05, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Wrap(
                      runSpacing: 18,
                      spacing: w * 7 / 100,
                      alignment: WrapAlignment.spaceEvenly,
                      children: [
                        Items(
                          colors: [Color(0xffFF6161), Colors.white],
                          screenWidth: w,
                          isSaved: isSaved,
                          itempic:
                              'assets/icons/store/fashionsImages/tshirt.png',
                          itemname: 'BUTTERFLY T-SHIRT',
                          tag: 'Fashion',
                          price: 524000.00,
                          onPressed: (p0, p1, p2, p3) {
                            itemDetails(p0, p1, p2, p3);
                          },
                        ),
                        Items(
                          colors: [Color(0xffFF6161), Colors.white],
                          screenWidth: w,
                          isSaved: isSaved,
                          itempic:
                              'assets/icons/store/fashionsImages/butterflyhoodie.png',
                          itemname: 'BUTTERFLY HOODIE',
                          tag: 'Fashion',
                          price: 650000.00,
                          onPressed: (p0, p1, p2, p3) {
                            itemDetails(p0, p1, p2, p3);
                          },
                        ),
                        Items(
                          colors: [Color(0xffFF6161), Colors.white],
                          screenWidth: w,
                          isSaved: isSaved,
                          itempic:
                              'assets/icons/store/fashionsImages/butterflyhoodie.png',
                          itemname: 'BUTTERFLY HOODIE',
                          tag: 'Fashion',
                          price: 650000.00,
                          onPressed: (p0, p1, p2, p3) {
                            itemDetails(p0, p1, p2, p3);
                          },
                        ),
                        Items(
                          colors: [Color(0xffFF6161), Colors.white],
                          screenWidth: w,
                          isSaved: isSaved,
                          itempic:
                              'assets/icons/store/fashionsImages/butterflyhoodie.png',
                          itemname: 'BUTTERFLY HOODIE',
                          tag: 'Fashion',
                          price: 650000.00,
                          onPressed: (p0, p1, p2, p3) {
                            itemDetails(p0, p1, p2, p3);
                          },
                        ),
                        Items(
                          colors: [Color(0xffFF6161), Colors.white],
                          screenWidth: w,
                          isSaved: isSaved,
                          itempic:
                              'assets/icons/store/fashionsImages/butterflyhoodie.png',
                          itemname: 'BUTTERFLY HOODIE',
                          tag: 'Fashion',
                          price: 650000.00,
                          onPressed: (p0, p1, p2, p3) {
                            itemDetails(p0, p1, p2, p3);
                          },
                        ),
                        Items(
                          colors: [Color(0xffFF6161), Colors.white],
                          screenWidth: w,
                          isSaved: isSaved,
                          itempic:
                              'assets/icons/store/fashionsImages/butterflyhoodie.png',
                          itemname: 'BUTTERFLY HOODIE',
                          tag: 'Fashion',
                          price: 650000.00,
                          onPressed: (p0, p1, p2, p3) {
                            itemDetails(p0, p1, p2, p3);
                          },
                        ),
                        Items(
                          colors: [Color(0xffFF6161), Colors.white],
                          screenWidth: w,
                          isSaved: isSaved,
                          itempic:
                              'assets/icons/store/fashionsImages/butterflyhoodie.png',
                          itemname: 'BUTTERFLY HOODIE',
                          tag: 'Fashion',
                          price: 650000.00,
                          onPressed: (p0, p1, p2, p3) {
                            itemDetails(p0, p1, p2, p3);
                          },
                        ),
                        Items(
                          colors: [Color(0xffFF6161), Colors.white],
                          screenWidth: w,
                          isSaved: isSaved,
                          itempic:
                              'assets/icons/store/fashionsImages/butterflyhoodie.png',
                          itemname: 'BUTTERFLY HOODIE',
                          tag: 'Fashion',
                          price: 650000.00,
                          onPressed: (p0, p1, p2, p3) {
                            itemDetails(p0, p1, p2, p3);
                          },
                        ),
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
  final double price;
  final String itemname;
  final bool isSaved;
  final List<Color> colors;
  final Function(String, double, String, List<Color>) onPressed;

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
    return Container(
      width: widget.screenWidth * 43 / 100,
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
          Text(
            CurrencyFormat.convertToIdr(widget.price, 2),
            style: TextStyle(fontSize: widget.screenWidth * 3.5 / 100),
          ),
        ],
      ),
    );
  }
}
