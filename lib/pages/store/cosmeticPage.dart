import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CosmeticPage extends StatelessWidget {
  const CosmeticPage({super.key});

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
                child: Container(
                  child: SvgPicture.asset('assets/icons/navbar/Cart.svg'),
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
                        'Cosmetic Brands',
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
                                'assets/icons/store/cosmetic_brands/loreal.png',
                            desc: 'Loreal Paris',
                          ),
                          Brands(
                            screenWidth: screenWidth,
                            image:
                                'assets/icons/store/cosmetic_brands/loreal.png',
                            desc: 'Loreal Paris',
                          ),
                          Brands(
                            screenWidth: screenWidth,
                            image:
                                'assets/icons/store/cosmetic_brands/loreal.png',
                            desc: 'Loreal Paris',
                          ),
                          Brands(
                            screenWidth: screenWidth,
                            image:
                                'assets/icons/store/cosmetic_brands/loreal.png',
                            desc: 'Loreal Paris',
                          ),
                          Brands(
                            screenWidth: screenWidth,
                            image:
                                'assets/icons/store/cosmetic_brands/loreal.png',
                            desc: 'Loreal Paris',
                          ),
                          Brands(
                            screenWidth: screenWidth,
                            image:
                                'assets/icons/store/cosmetic_brands/loreal.png',
                            desc: 'Loreal Paris',
                          ),
                          Brands(
                            screenWidth: screenWidth,
                            image:
                                'assets/icons/store/cosmetic_brands/loreal.png',
                            desc: 'Loreal Paris',
                          ),
                          Brands(
                            screenWidth: screenWidth,
                            image:
                                'assets/icons/store/cosmetic_brands/loreal.png',
                            desc: 'Loreal Paris',
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
                      screenWidth: screenWidth,
                      itempic: 'assets/icons/store/fashionsImages/tshirt.png',
                      itemname: 'Toner Loreal',
                      price: '140.000,00',
                      tag: 'Cosmetics',
                      isSaved: isSaved,
                    ),
                    Items(
                      screenWidth: screenWidth,
                      itempic: 'assets/icons/store/fashionsImages/tshirt.png',
                      itemname: 'Toner Loreal',
                      price: '140.000,00',
                      tag: 'Cosmetics',
                      isSaved: isSaved,
                    ),
                    Items(
                      screenWidth: screenWidth,
                      itempic: 'assets/icons/store/fashionsImages/tshirt.png',
                      itemname: 'Toner Loreal',
                      price: '140.000,00',
                      tag: 'Cosmetics',
                      isSaved: isSaved,
                    ),
                    Items(
                      screenWidth: screenWidth,
                      itempic: 'assets/icons/store/fashionsImages/tshirt.png',
                      itemname: 'Toner Loreal',
                      price: '140.000,00',
                      tag: 'Cosmetics',
                      isSaved: isSaved,
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

class Items extends StatefulWidget {
  Items({
    super.key,
    required this.screenWidth,
    required this.itempic,
    required this.itemname,
    required this.price,
    required this.tag,
    required this.isSaved,
  });

  final double screenWidth;
  final String itempic;
  final String tag;
  final String price;
  final String itemname;
  final bool isSaved;

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
      width: widget.screenWidth * 43 / 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
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
          Text(
            'RP. ${widget.price}',
            style: TextStyle(fontSize: widget.screenWidth * 3.5 / 100),
          ),
        ],
      ),
    );
  }
}
