import 'package:authentic_guards/utils/payment/payNSend.dart';
import 'package:authentic_guards/utils/payment/transactionHistory.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class BalanceCheckPage extends StatefulWidget {
  BalanceCheckPage({super.key});

  @override
  State<BalanceCheckPage> createState() => _BalanceCheckPageState();
}

class _BalanceCheckPageState extends State<BalanceCheckPage> {
  List<String> sortingMethods = ['Date', 'Service'];
  String selectedMethod = 'Date';
  final PanelController _panelController = PanelController();

  void AddPressed() {
    print('Add button pressed');
  }

  void PayNSend() {
    if (_panelController.isAttached) {
      _panelController.open();
    }
  }

  void DiscoverPressed() {
    print('DiscoverButton pressed');
  }

  void onSortingMethodChanged(String? newValue) {
    setState(() {
      selectedMethod = newValue!;
      // Implement your sorting logic here based on the selectedMethod
      // For example, call a function to sort the data in your list based on the selectedMethod.
      // After sorting, update your UI to reflect the new order.
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final screenWidth = mediaQueryData.size.width;
    final screenHeight = mediaQueryData.size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.black, size: 30),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/other/bg2.png'),
                  alignment: Alignment.topCenter,
                  fit: BoxFit.contain),
            ),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Container(
                  width: screenWidth,
                  height: 900,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.elliptical(200, 120),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.only(top: 60),
                          height: screenHeight * 13 / 100,
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                        color: Colors.black.withOpacity(0.2),
                                        offset: Offset(0, 5),
                                        blurRadius: 3,
                                        spreadRadius: 1,
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(35)),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      _panelController.open();
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.2),
                                              offset: Offset(0, 5),
                                              blurRadius: 3,
                                              spreadRadius: 1,
                                            ),
                                          ]),
                                      child: CircleAvatar(
                                        radius: 30.0,
                                        backgroundImage: AssetImage(
                                            'assets/icons/LogoAGT.png'),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Hi, Username!",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
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
                                icon: 'assets/icons/discovery-svgrepo-com.svg',
                                desc: "Discover",
                                panelController: _panelController,
                                onPressed: DiscoverPressed,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 28),
                        child: Text(
                          "Transaction History",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: screenWidth * 25 / 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.horizontal(
                                    left: Radius.elliptical(20, 20),
                                    right: Radius.elliptical(20, 20)),
                                border: Border.all(width: 1)),
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                icon: Icon(Icons.keyboard_arrow_down),
                                value: selectedMethod,
                                onChanged: onSortingMethodChanged,
                                items: sortingMethods
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                      value: value,
                                      child: Center(child: Text(value)));
                                }).toList(),
                              ),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: screenWidth * 25 / 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.horizontal(
                                    left: Radius.elliptical(20, 20),
                                    right: Radius.elliptical(20, 20)),
                                border: Border.all(width: 1)),
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                icon: Icon(Icons.keyboard_arrow_down),
                                value: selectedMethod,
                                onChanged: onSortingMethodChanged,
                                items: sortingMethods
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                      value: value,
                                      child: Center(child: Text(value)));
                                }).toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      TransactionHistory(
                        hari: 'Friday',
                        tanggal: "09 Sep 2022",
                        desc1: "AG Points Top Up",
                        desc2: 'VA BCA',
                        status: 1,
                        nominal: "100.000",
                      ),
                      TransactionHistory(
                        hari: 'Friday',
                        tanggal: "08 Sep 2022",
                        desc1: "Isi Pulsa Telkomsel",
                        desc2: '08125139098',
                        status: 2,
                        nominal: "250.000",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          PaySlidingMenu(
            panelController: _panelController,
          ),
        ],
      ),
    );
  }
}
