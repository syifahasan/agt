import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'itemDetails.dart';
import 'store.dart';
import '../store/myCart.dart';

class FashionPage extends StatefulWidget {
  const FashionPage({super.key});

  @override
  State<FashionPage> createState() => _FashionPageState();
}

class _FashionPageState extends State<FashionPage> {
  bool isSaved = false;
  late String itempic;
  late double price;
  late String itemname;
  late List<Color> colors;

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
    final TextEditingController _searchController = TextEditingController();
    final mediaQueryData = MediaQuery.of(context);
    final screenWidth = mediaQueryData.size.width;
    final screenHeight = mediaQueryData.size.height;
    bool isSaved = false;
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(85.0),
        child: AppBar(
          automaticallyImplyLeading: false,
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
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyCart(cartItems: []),
                      ),
                    );
                  },
                  child: Container(
                    child: SvgPicture.asset('assets/icons/navbar/Cart.svg'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    bottom: 20,
                  ),
                  width: screenWidth * 90 / 100,
                  height: screenWidth * 50 / 100,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          offset: Offset(0, 4),
                          blurRadius: 3),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        'Fashion Brands',
                        style: TextStyle(
                          fontSize: screenWidth * 4 / 100,
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
                        spacing: screenWidth * 5 / 100,
                        children: [
                          Brands(
                            screenWidth: screenWidth,
                            image:
                                'assets/icons/store/fashion_brands/adidas.png',
                            desc: 'Adidas',
                          ),
                          Brands(
                            screenWidth: screenWidth,
                            image: 'assets/icons/store/fashion_brands/nike.png',
                            desc: 'Nike',
                          ),
                          Brands(
                            screenWidth: screenWidth,
                            image: 'assets/icons/store/fashion_brands/hnm.png',
                            desc: 'H & M',
                          ),
                          Brands(
                            screenWidth: screenWidth,
                            image:
                                'assets/icons/store/fashion_brands/adidas.png',
                            desc: 'Adidas Paris',
                          ),
                          Brands(
                            screenWidth: screenWidth,
                            image:
                                'assets/icons/store/fashion_brands/adidas.png',
                            desc: 'Adidas Paris',
                          ),
                          Brands(
                            screenWidth: screenWidth,
                            image:
                                'assets/icons/store/fashion_brands/adidas.png',
                            desc: 'Adidas Paris',
                          ),
                          Brands(
                            screenWidth: screenWidth,
                            image:
                                'assets/icons/store/fashion_brands/adidas.png',
                            desc: 'Adidas Paris',
                          ),
                          Brands(
                            screenWidth: screenWidth,
                            image:
                                'assets/icons/store/fashion_brands/adidas.png',
                            desc: 'Adidas Paris',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Text(
                        'Best Seller',
                        style: TextStyle(
                          fontSize: screenWidth * 4 / 100,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Wrap(
                  runSpacing: 18,
                  spacing: 5 / 100 * screenWidth,
                  alignment: WrapAlignment.spaceEvenly,
                  children: [
                    Items(
                      colors: [Colors.black, Colors.white],
                      screenWidth: screenWidth,
                      itempic:
                          'assets/icons/store/fashionsImages/kaosadidas.jpeg',
                      itemname: 'T-Shirt Adidas',
                      price: 140000.00,
                      tag: 'Cosmetics',
                      isSaved: isSaved,
                      onPressed: (p0, p1, p2, p3) {
                        itemDetails(p0, p1, p2, p3);
                      },
                    ),
                    Items(
                      colors: [Colors.black, Colors.white],
                      screenWidth: screenWidth,
                      itempic: 'assets/icons/store/fashionsImages/tshirt.png',
                      itemname: 'Toner Loreal',
                      price: 140000.00,
                      tag: 'Cosmetics',
                      isSaved: isSaved,
                      onPressed: (p0, p1, p2, p3) {
                        itemDetails(p0, p1, p2, p3);
                      },
                    ),
                    Items(
                      colors: [Colors.black, Colors.white],
                      screenWidth: screenWidth,
                      itempic: 'assets/icons/store/fashionsImages/tshirt.png',
                      itemname: 'Toner Loreal',
                      price: 140000.00,
                      tag: 'Cosmetics',
                      isSaved: isSaved,
                      onPressed: (p0, p1, p2, p3) {
                        itemDetails(p0, p1, p2, p3);
                      },
                    ),
                    Items(
                      colors: [Colors.black, Colors.white],
                      screenWidth: screenWidth,
                      itempic: 'assets/icons/store/fashionsImages/tshirt.png',
                      itemname: 'Toner Loreal',
                      price: 140000.00,
                      tag: 'Cosmetics',
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
        ],
      ),
    );
  }
}

class Brands extends StatelessWidget {
  Brands({
    super.key,
    required this.screenWidth,
    required this.image,
    required this.desc,
    this.method,
  });

  final double screenWidth;
  final String image;
  final String desc;
  VoidCallback? method;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: method,
      child: Container(
        width: screenWidth * 18 / 100,
        child: Column(
          children: [
            Container(
              width: screenWidth * 18 / 100,
              height: screenWidth * 18 / 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.fill,
                ),
                border: Border.all(width: 1, color: Color(0xffe3e3e6)),
                color: Colors.black,
                borderRadius: BorderRadius.circular(screenWidth * 50 / 100),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: Offset(0, 4),
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
      ),
    );
  }
}
