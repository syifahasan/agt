import 'package:authentic_guards/pages/scanner/proner.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';



class Congratulations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final w = mediaQueryData.size.width;
    final h = mediaQueryData.size.height;
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
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  "Congratulations!",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
                ),
              ),
              SizedBox(height: 200),
              Container(
                child: Text(
                  "The product you purchase is",
                  style: TextStyle(fontSize: 13),
                ),
              ),
              Container(
                child: Text(
                  "genuine/authentic",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
                ),
              ),
              SizedBox(height: 50),
              Container(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: "Please check your ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                          )),
                      TextSpan(
                        text: 'product details',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 13,
                        ),
                      ),
                      // TextSpan(
                      //   text: ' dan teks yang tidak tebal.',
                      // ),
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
                          text: "and input your ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                          )),
                      TextSpan(
                        text: 'unique code',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 13,
                        ),
                      ),
                      // TextSpan(
                      //   text: ' dan teks yang tidak tebal.',
                      // ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Text(
                  "down below!",
                  style: TextStyle(fontSize: 13),
                ),
              ),
              SizedBox(height: 100),
              Container(
                width: 150.0, // Lebar Container
                height: 150.0, // Tinggi Container
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),

                child: ImageCarouselSlider(),
              ),
              SizedBox(height: 15),
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: w * 0.9,
                      height: w * 0.75,
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      bottom: 0,
                      child: Container(
                        width: w * 0.9,
                        height: w * 0.65,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 100.0,
                      top: 5.0,
                      child: Text(
                        'Product Details',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20.0,
                      top: 45.0,
                      child: Center(
                        child: Container(
                          width: w * 0.8,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Name',
                                    style: TextStyle(
                                      fontSize: 13,
                                    ),
                                  ),
                                  Container(
                                    width: w * 0.4,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          ': Roman Picisan',
                                          style: TextStyle(
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Nicotine',
                                    style: TextStyle(
                                      fontSize: 13,
                                    ),
                                  ),
                                  Container(
                                    width: w * 0.4,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          child: RichText(
                                            softWrap: true,
                                            maxLines: 2,
                                            text: TextSpan(
                                              text: ': 6mg',
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Size',
                                    style: TextStyle(
                                      fontSize: 13,
                                    ),
                                  ),
                                  Container(
                                    width: w * 0.4,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          child: RichText(
                                            softWrap: true,
                                            maxLines: 2,
                                            text: TextSpan(
                                              text: ': 60ml',
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Flavour',
                                    style: TextStyle(
                                      fontSize: 13,
                                    ),
                                  ),
                                  Container(
                                    width: w * 0.4,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          child: RichText(
                                            // softWrap: true,
                                            text: TextSpan(
                                              text: ': Starwberry Cream Yogurt',
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Production Date',
                                    style: TextStyle(
                                      fontSize: 13,
                                    ),
                                  ),
                                  Container(
                                    width: w * 0.4,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          child: RichText(
                                            softWrap: true,
                                            maxLines: 2,
                                            text: TextSpan(
                                              text: ': 21-05-22',
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Company',
                                    style: TextStyle(
                                      fontSize: 13,
                                    ),
                                  ),
                                  Container(
                                    width: w * 0.4,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          child: RichText(
                                            softWrap: true,
                                            maxLines: 2,
                                            text: TextSpan(
                                              text:
                                                  ': PT ASIA VAPORINDO BERJAYA',
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Email',
                                    style: TextStyle(
                                      fontSize: 13,
                                    ),
                                  ),
                                  Container(
                                    width: w * 0.4,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          child: RichText(
                                            softWrap: true,
                                            maxLines: 2,
                                            text: TextSpan(
                                              text: ': juicenationco@gmail.com',
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Webisite',
                                    style: TextStyle(
                                      fontSize: 13,
                                    ),
                                  ),
                                  Container(
                                    width: w * 0.4,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          child: RichText(
                                            softWrap: true,
                                            maxLines: 2,
                                            text: TextSpan(
                                              text: ': www.juicenation.co.id',
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Company Hotline',
                                    style: TextStyle(
                                      fontSize: 13,
                                    ),
                                  ),
                                  Container(
                                    width: w * 0.4,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          child: RichText(
                                            softWrap: true,
                                            maxLines: 2,
                                            text: TextSpan(
                                              text: ': 081222201649',
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Container(
                child: Text(
                  "This product has been claimed!",
                  style: TextStyle(fontSize: 13),
                ),
              ),
              Container(
                child: Text(
                  "You can check the product owner by clicking",
                  style: TextStyle(fontSize: 13),
                ),
              ),
              Container(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: " Product Owner ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                        text: 'down below!',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                        ),
                      ),
                      // TextSpan(
                      //   text: ' dan teks yang tidak tebal.',
                      // ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => proner()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[300], // Warna latar belakang tombol
                  onPrimary: Colors.white, // Warna teks tombol
                  minimumSize: Size(250.0, 40.0),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(40.0), // Atur sudut bulat di sini
                  ),
                ),
                child: Text(
                  'Product Owner',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ],
      ),
    );
  }
}

class ImageCarouselSlider extends StatelessWidget {
  final List<String> imagePaths = [
    'assets/other/liquid.png',
    'assets/other/liquid.png',
    'assets/other/liquid.png',
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200,
        autoPlay: true, // Untuk otomatis memutar gambar
        autoPlayInterval:
            Duration(seconds: 2), // Interval waktu antara setiap gambar
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
      ),
      items: imagePaths.map((path) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Image.asset(path, fit: BoxFit.cover),
            );
          },
        );
      }).toList(),
    );
  }
}
