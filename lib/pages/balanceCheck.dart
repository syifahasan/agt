import 'package:flutter/material.dart';
import 'home.dart';

class BalanceCheckPage extends StatelessWidget {
  const BalanceCheckPage({super.key});

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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/other/bg2.png'),
              alignment: Alignment.topCenter,
              fit: BoxFit.contain),
        ),
        child: ListView(
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
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.only(top: 60),
                    height: screenHeight * 17 / 100,
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
                        colors: [Color.fromARGB(255, 58, 57, 57), Colors.white],
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
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      offset: Offset(0, 5),
                                      blurRadius: 3,
                                      spreadRadius: 1,
                                    ),
                                  ]),
                              child: CircleAvatar(
                                radius: 30.0,
                                backgroundImage:
                                    AssetImage('assets/icons/LogoAGT.png'),
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
                                  fontSize: 16,
                                ),
                              ),
                              Text("AG Points"),
                              Text(
                                "Rp.250.000",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text("Active"),
                            ],
                          ),
                        ),
                        ActionButtons(
                          icon: 'assets/icons/add-svgrepo-com.svg',
                          desc: "Add",
                        ),
                        ActionButtons(
                          icon: 'assets/icons/arrow-top-3-svgrepo-com.svg',
                          desc: "Pay",
                        ),
                        ActionButtons(
                          icon: 'assets/icons/discovery-svgrepo-com.svg',
                          desc: "Discover",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
