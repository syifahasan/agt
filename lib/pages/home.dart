import 'package:authentic_guards/domain/model/user.dart';
import 'package:authentic_guards/pages/payment/balanceCheck.dart';
import 'package:authentic_guards/pages/store/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:ui' as ui;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../utils/payment/payNSend.dart';
import './payment/topUp.dart';
import '../utils/customscroll.dart';
import './store/itemDetails.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  final PanelController _panelController = PanelController();

  void AddPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TopUpPage()),
    );
    print('Add button pressed');
  }

  void _stores() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StorePage(),
      ),
    );
  }

  void _pulsa() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SnackbarPage(),
      ),
    );
  }

  void _pln() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SnackbarPage(),
      ),
    );
  }

  void _pdam() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SnackbarPage(),
      ),
    );
  }

  void _flightticket() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SnackbarPage(),
      ),
    );
  }

  void _trainticket() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SnackbarPage(),
      ),
    );
  }

  void _authnews() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SnackbarPage(),
      ),
    );
  }

  void _viewall() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SnackbarPage(),
      ),
    );
  }

  void PayNSend() {
    _panelController.isAttached
        ? _panelController.open()
        : _panelController.close();
    print(_panelController.isAttached);
  }

  void DiscoverPressed() {
    print('DiscoverButton pressed');
  }

  @override
  Widget build(BuildContext context) {
    bool isSaved = false;
    late String itempic;
    late double price;
    late String itemname;
    late List<Color> colors;
    final mediaQueryData = MediaQuery.of(context);
    final screenWidth = mediaQueryData.size.width;
    final screenHeight = mediaQueryData.size.height;
    final userModelProvider = Provider.of<UserModelProvider>(context);
    print("Current full name: ${userModelProvider.userModel?.fullName}");

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

    return Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(85.0),
          child: AppBar(
            toolbarHeight: 80,
            automaticallyImplyLeading: false,
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
                    margin: EdgeInsets.only(top: 20, right: 20),
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
                          child: SvgPicture.asset(
                              'assets/icons/navbar/Search.svg'),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(50)),
                        filled: true,
                        fillColor: Color(0xffD9D9D9),
                        hintText: 'Search',
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
                  width: 37,
                  height: 37,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      offset: Offset(0, 2),
                      blurRadius: 3,
                      spreadRadius: 1,
                    ),
                  ], borderRadius: BorderRadius.circular(30)),
                  margin: EdgeInsets.only(top: 20, right: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/ProfilePage');
                    },
                    child: CircleAvatar(
                      radius: 20.0,
                      backgroundImage: AssetImage('assets/other/profile1.png'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/other/bg.png'),
                    fit: BoxFit.cover,
                    scale: 2.0),
              ),
              child: ListView(
                physics: CustomBounceScroll(),
                children: [
                  Column(
                    children: [
                      Stack(
                        children: [
                          Positioned(
                            child: Container(
                              margin: EdgeInsets.only(top: 90),
                              padding: EdgeInsets.symmetric(
                                  vertical: 50, horizontal: 0),
                              // height: 500,
                              width: screenWidth,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: Wrap(
                                      alignment: WrapAlignment.spaceEvenly,
                                      runSpacing: 20,
                                      spacing: screenWidth * 7 / 100,
                                      children: [
                                        Menu(
                                          screenWidth: screenWidth,
                                          image:
                                              'assets/icons/news-svgrepo-com.png',
                                          desc: 'Authentic News',
                                          method: _authnews,
                                        ),
                                        Menu(
                                          screenWidth: screenWidth,
                                          image: 'assets/icons/agtlogo.png',
                                          desc: 'Authentic Store',
                                          method: _stores,
                                        ),
                                        Menu(
                                          screenWidth: screenWidth,
                                          image:
                                              'assets/icons/smartphone-svgrepo-com.png',
                                          desc: 'Pulsa',
                                          method: _pulsa,
                                        ),
                                        Menu(
                                          screenWidth: screenWidth,
                                          image:
                                              'assets/icons/plugin-svgrepo-com.png',
                                          desc: 'PLN',
                                          method: _pln,
                                        ),
                                        Menu(
                                          screenWidth: screenWidth,
                                          image:
                                              'assets/icons/water-svgrepo-com.png',
                                          desc: 'PDAM',
                                          method: _pdam,
                                        ),
                                        Menu(
                                          screenWidth: screenWidth,
                                          image:
                                              'assets/icons/plane-svgrepo-com.png',
                                          desc: 'Flight ticket',
                                          method: _flightticket,
                                        ),
                                        Menu(
                                          screenWidth: screenWidth,
                                          image:
                                              'assets/icons/train-svgrepo-com.png',
                                          desc: 'Train ticket',
                                          method: _trainticket,
                                        ),
                                        Menu(
                                          screenWidth: screenWidth,
                                          image:
                                              'assets/icons/stack-svgrepo-com.png',
                                          desc: 'View All',
                                          method: _viewall,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                      "News Update",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),

                                  // MENU NEWS UPDATE
                                  SingleChildScrollView(
                                    physics: BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          width: screenWidth * 85 / 100,
                                          height: 200,
                                          child: Image.asset(
                                            'assets/other/payo.png',
                                            fit: BoxFit.cover,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.grey,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          width: screenWidth * 85 / 100,
                                          height: 200,
                                          child: Image.asset(
                                            'assets/other/50.png',
                                            fit: BoxFit.cover,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.grey,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          width: screenWidth * 85 / 100,
                                          height: 200,
                                          child: Image.asset(
                                            'assets/other/flassale.png',
                                            fit: BoxFit.cover,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                      "Hot Sales",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),

                                  // MENU HOT SALES
                                  SingleChildScrollView(
                                    physics: BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 13),
                                        ),
                                        Items(
                                          colors: [Colors.black, Colors.white],
                                          screenWidth: screenWidth,
                                          itempic:
                                              'assets/icons/store/fashionsImages/tshirt.png',
                                          itemname: 'BUTTERFLY T-SHIRT',
                                          price: 524223.68,
                                          tag: 'Fashion',
                                          isSaved: isSaved,
                                          onPressed: (p0, p1, p2, p3) {
                                            itemDetails(p0, p1, p2, p3);
                                          },
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 25),
                                        ),
                                        Items(
                                          colors: [Colors.black, Colors.white],
                                          screenWidth: screenWidth,
                                          itempic:
                                              'assets/icons/store/fashionsImages/butterflyhoodie.png',
                                          itemname: 'BUTTERFLY HOODIE',
                                          price: 899999.00,
                                          tag: 'Fashion',
                                          isSaved: isSaved,
                                          onPressed: (p0, p1, p2, p3) {
                                            itemDetails(p0, p1, p2, p3);
                                          },
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 25),
                                        ),
                                        Items(
                                          colors: [Colors.black, Colors.white],
                                          screenWidth: screenWidth,
                                          itempic:
                                              'assets/icons/store/fashionsImages/tshirt.png',
                                          itemname: 'BUTTERFLY T-SHIRT',
                                          price: 524223.68,
                                          tag: 'Fashion',
                                          isSaved: isSaved,
                                          onPressed: (p0, p1, p2, p3) {
                                            itemDetails(p0, p1, p2, p3);
                                          },
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 25),
                                        ),
                                        Items(
                                          colors: [Colors.black, Colors.white],
                                          screenWidth: screenWidth,
                                          itempic:
                                              'assets/icons/store/fashionsImages/butterflyhoodie.png',
                                          itemname: 'BUTTERFLY HOODIE',
                                          price: 899999.00,
                                          tag: 'Fashion',
                                          isSaved: isSaved,
                                          onPressed: (p0, p1, p2, p3) {
                                            itemDetails(p0, p1, p2, p3);
                                          },
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 25),
                                        ),
                                        Items(
                                          colors: [Colors.black, Colors.white],
                                          screenWidth: screenWidth,
                                          itempic:
                                              'assets/icons/store/fashionsImages/tshirt.png',
                                          itemname: 'BUTTERFLY T-SHIRT',
                                          price: 524223.68,
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
                          ),
                          Positioned(
                            top: 0,
                            right: 18,
                            child: Container(
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.only(top: 20),
                              height: screenHeight * 12 / 100,
                              width: 90 / 100 * screenWidth,
                              decoration: BoxDecoration(
                                // color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    offset: Offset(0, 5),
                                    blurRadius: 3,
                                    spreadRadius: 1,
                                  ),
                                ],
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 58, 57, 57),
                                    Colors.white
                                  ],
                                  begin: Alignment(0, -20),
                                  end: Alignment(0, 2),
                                ),
                                borderRadius: BorderRadius.circular(30),
                                // border: Border.all(color: Colors.black, width: 2),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: screenWidth * 15 / 100,
                                    height: screenWidth * 15 / 100,
                                    decoration: BoxDecoration(
                                        gradient: RadialGradient(
                                          colors: [
                                            Colors.white,
                                            Color.fromARGB(255, 14, 13, 13)
                                          ],
                                          center: Alignment.bottomCenter,
                                          radius: 4,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.2),
                                            offset: Offset(0, 5),
                                            blurRadius: 3,
                                            spreadRadius: 1,
                                          ),
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(35)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          print("Button Tapped");
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  BalanceCheckPage(),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.2),
                                                  offset: Offset(0, 5),
                                                  blurRadius: 3,
                                                  spreadRadius: 1,
                                                ),
                                              ]),
                                          child: CircleAvatar(
                                            radius: 30.0,
                                            backgroundImage: AssetImage(
                                                'assets/icons/agtlogo.png'),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          (userModelProvider.userModel?.fullName
                                                          ?.length ??
                                                      0) >
                                                  12
                                              ? userModelProvider
                                                  .userModel!.fullName!
                                                  .substring(0, 12)
                                              : userModelProvider
                                                      .userModel?.fullName ??
                                                  "Username",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: screenWidth * 0.04,
                                          ),
                                        ),
                                        Text("AG Points"),
                                        Text(
                                          "Rp.250.000",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                        Text("Active"),
                                      ],
                                    ),
                                  ),
                                  ActionButtons(
                                    icon: 'assets/icons/add-svgrepo-com.svg',
                                    desc: "Add",
                                    panelController: _panelController,
                                    onPressed: AddPressed,
                                  ),
                                  ActionButtons(
                                    icon:
                                        'assets/icons/arrow-top-3-svgrepo-com.svg',
                                    desc: "Pay",
                                    panelController: _panelController,
                                    onPressed: PayNSend,
                                  ),
                                  ActionButtons(
                                    icon:
                                        'assets/icons/discovery-svgrepo-com.svg',
                                    desc: "Discover",
                                    panelController: _panelController,
                                    onPressed: DiscoverPressed,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            PaySlidingMenu(
              panelController: _panelController,
            ),
          ],
        ));
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
                  width: widget.screenWidth * 10 / 100,
                  height: widget.screenWidth * 10 / 100,
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
            '\$${widget.price.toStringAsFixed(2)}',
            style: TextStyle(fontSize: widget.screenWidth * 3.5 / 100),
          ),
        ],
      ),
    );
  }
}

class Menu extends StatelessWidget {
  Menu({
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
    return Container(
      decoration: BoxDecoration(
        border: null,
      ),
      width: screenWidth * 16 / 100,
      child: Column(
        children: [
          GestureDetector(
            onTap: method,
            child: Container(
              width: screenWidth * 16 / 100,
              height: screenWidth * 16 / 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                ),
                color: Colors.black,
                border: null,
                borderRadius: BorderRadius.circular(screenWidth * 50 / 100),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: Offset(0, 5),
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
    );
  }
}

class ActionButtons extends StatelessWidget {
  ActionButtons({
    super.key,
    required this.icon,
    required this.desc,
    required this.onPressed,
    required this.panelController,
  });

  String icon;
  String desc;
  VoidCallback onPressed;
  final PanelController panelController;

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final screenWidth = mediaQueryData.size.width;
    final screenHeight = mediaQueryData.size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            onPressed();
          },
          child: Container(
            width: screenWidth * 12 / 100,
            height: screenWidth * 12 / 100,
            decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [Colors.white, Color.fromARGB(255, 14, 13, 13)],
                  center: Alignment.bottomCenter,
                  radius: 6,
                ),
                borderRadius: BorderRadius.circular(10)),
            child: SvgPicture.asset(icon),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          desc,
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class SnackbarPage extends StatefulWidget {
  @override
  _SnackbarPageState createState() => _SnackbarPageState();
}

class _SnackbarPageState extends State<SnackbarPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Under Developing'),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // Halaman ini tidak memiliki konten
    return Scaffold();
  }
}
