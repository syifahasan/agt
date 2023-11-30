import 'package:authentic_guards/pages/home.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:authentic_guards/pages/scanner/scan_result.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class proner extends StatefulWidget {
  const proner({super.key});

  @override
  State<proner> createState() => _pronerState();
}

class _pronerState extends State<proner> {
  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final w = mediaQueryData.size.width;
    final h = mediaQueryData.size.height;
    final screenWidth = mediaQueryData.size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              child: Text(
                "Product Owner",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: w * 0.050,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    height: w * 0.35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image(
                      image: AssetImage('assets/other/profile1.png'),
                      fit: BoxFit.fill,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: w * 0.05,
            ),
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    width: w * 0.9,
                    height: w * 0.5,
                    decoration: BoxDecoration(
                        color: Color(0xff474952),
                        borderRadius:
                            BorderRadius.all(Radius.circular(w * 0.04))),
                  ),
                  Positioned(
                    left: w * 0.31,
                    top: w * 0.017,
                    child: Text(
                      "Product Owner",
                      style: TextStyle(
                        color: Color(0xff9999A6),
                        fontWeight: FontWeight.w700,
                        fontSize: w * 0.04,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: w * 0.085,
                    bottom: w * 0,
                    child: Container(
                      width: w * 0.9,
                      height: w * 0.5,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius:
                              BorderRadius.all(Radius.circular(w * 0.04))),
                    ),
                  ),
                  Positioned(
                    left: w * 0.2, // Atur posisi horizontal teks
                    bottom: 25, // Atur posisi vertikal teks
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Nama', style: TextStyle(fontSize: w * 0.04)),
                        Text('Product', style: TextStyle(fontSize: w * 0.04)),
                        Text('Time', style: TextStyle(fontSize: w * 0.04)),
                        Text('Date', style: TextStyle(fontSize: w * 0.04)),
                        Text('Code', style: TextStyle(fontSize: w * 0.04)),
                        Text('Status', style: TextStyle(fontSize: w * 0.04)),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 80, // Atur posisi horizontal nilai
                    bottom: 25, // Atur posisi vertikal nilai
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(': Asep', style: TextStyle(fontSize: w * 0.04)),
                        Text(': Roman Picisan',
                            style: TextStyle(fontSize: w * 0.04)),
                        Text(': 21:05(GMT + 7)',
                            style: TextStyle(fontSize: w * 0.04)),
                        Text(': 18-10-2023',
                            style: TextStyle(fontSize: w * 0.04)),
                        Text(': 2***09', style: TextStyle(fontSize: w * 0.04)),
                        Text(': Claimed',
                            style: TextStyle(
                                fontSize: w * 0.04,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: "This product has been ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: w * 0.04,
                        )),
                    TextSpan(
                      text: "Claimed!",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: w * 0.04,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: "You can check out the ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: w * 0.04,
                        )),
                    TextSpan(
                      text: "Family Tree",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: w * 0.04,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: "\n Or go back to homepage! ",
                      style: TextStyle(
                        fontSize: w * 0.04,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: w * 0.8,
              height: w * 0.12,
              margin: EdgeInsets.only(top: w * 0.05),
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Family Tree',
                    style: TextStyle(
                        fontSize: w * 0.04, color: Color(0xff474952))),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xffE3E3E6)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(w * 0.06)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Container(
              width: w * 0.8,
              height: w * 0.12,
              margin: EdgeInsets.only(top: w * 0.05),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Text('Back to homepage',
                    style: TextStyle(
                        fontSize: w * 0.04, color: Color(0xff474952))),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xffE3E3E6)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(w * 0.06)),
                  ),
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }

  Widget buildDataRow(String label, String value) {
    return Row(
      children: <Widget>[
        Expanded(child: Text('$label:', style: TextStyle(fontSize: 18))),
        Expanded(
          child: Text(value, style: TextStyle(fontSize: 18)),
        ),
      ],
    );
  }
}
