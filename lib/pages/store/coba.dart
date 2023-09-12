import 'package:flutter/material.dart';
import 'package:authentic_guards/pages/profile/appBar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';

import 'package:get/get.dart';

class Coba extends StatefulWidget {
  @override
  _CobaState createState() => _CobaState();
}

class _CobaState extends State<Coba> {
  // Daftar tampilan
  List<Widget> contents = [
    tampilan1(),
    tampilan2(),
    tampilan3(),
  ];

  // Indeks tampilan saat ini
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
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
          ),
        ),
        title: Text(
          "Blast Sale",
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
          ),
        ],
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    // Menampilkan teks berdasarkan indeks saat ini
                    ...List.generate(contents.length, (index) {
                      // Membuat daftar tombol
                      return Container(
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(w * 0.05),
                                topRight: Radius.circular(w * 0.05))),
                        margin: EdgeInsets.only(left: 5),
                        width: w * 0.28,
                        height: w * 0.15,
                        child: TextButton(
                          child: FlashSaleTimerWidget(
                            endTime: DateTime.now().add(Duration(
                                hours:
                                    2)), // misalkan flash sale berakhir dalam 2 jam dari sekarang
                          ),
                          onPressed: () {
                            setState(() {
                              _currentIndex =
                                  index; // Mengubah indeks saat ini ketika tombol ditekan
                            });
                          },
                        ),
                      );
                    }),
                  ],
                ),
              ),
              contents[_currentIndex],
              // Text(contents[_currentIndex]),
            ],
          ),
        ],
      ),
    );
  }
}

class tampilan1 extends StatelessWidget {
  const tampilan1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SaleItems(
            itemname: 'BUTTERFLY HOODIE',
            discount: 'Rp 799.999.99',
            price: 'Rp 499.999.999',
            desc: '28 Sold',
          ),
          SaleItems(
            itemname: 'PANCOAT HOODIE',
            discount: 'Rp 699.999.999',
            price: 'Rp 399.399.999',
            desc: 'Limited Stok',
          ),
          SaleItems(
            itemname: 'BUTTERFLY HOODIE',
            discount: 'Rp 899.999.999',
            price: 'Rp 699.999.999',
            desc: '30 Sold',
          ),
          SaleItems(
            itemname: 'DRAGON HOODIE',
            discount: 'Rp 399.999.999',
            price: 'Rp 200.000.000',
            desc: '1 Sold',
          ),
        ],
      ),
    );
  }
}

class tampilan2 extends StatelessWidget {
  const tampilan2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SaleItems(
            itemname: 'BUTTERFLY HOODIE',
            discount: 'Rp 799.999.99',
            price: 'Rp 499.999.999',
            desc: '28 Sold',
          ),
          SaleItems(
            itemname: 'PANCOAT HOODIE',
            discount: 'Rp 699.999.999',
            price: 'Rp 399.399.999',
            desc: 'Limited Stok',
          ),
          SaleItems(
            itemname: 'BUTTERFLY HOODIE',
            discount: 'Rp 899.999.999',
            price: 'Rp 699.999.999',
            desc: '30 Sold',
          ),
        ],
      ),
    );
  }
}

class tampilan3 extends StatelessWidget {
  const tampilan3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SaleItems(
            itemname: 'BUTTERFLY HOODIE',
            discount: 'Rp 799.999.99',
            price: 'Rp 499.999.999',
            desc: '28 Sold',
          ),
          SaleItems(
            itemname: 'PANCOAT HOODIE',
            discount: 'Rp 699.999.999',
            price: 'Rp 399.399.999',
            desc: 'Limited Stok',
          ),
        ],
      ),
    );
  }
}

class SaleItems extends StatefulWidget {
  const SaleItems({
    super.key,
    required this.itemname,
    required this.discount,
    required this.price,
    required this.desc,
  });

  final String itemname;
  final String discount;
  final String price;
  final String desc;

  @override
  State<SaleItems> createState() => _SaleItemsState();
}

class _SaleItemsState extends State<SaleItems> {
  double _progressValue = 0.7; // Initial value

  void _updateProgress(double newValue) {
    setState(() {
      _progressValue = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Container(
      child: Row(
        children: [
          Container(
            width: w * 0.28,
            height: w * 0.30,
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage(
                      'assets/icons/store/fashionsImages/butterflyhoodie.png')),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    color: Color(0xffD9d9d9),
                    offset: Offset(0, 3),
                    blurRadius: 4,
                    spreadRadius: 1),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 7),
            padding: EdgeInsets.only(bottom: 5),
            width: w * 0.45,
            height: w * 0.30,
            decoration: BoxDecoration(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.itemname,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Garment dyed Hooide',
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  widget.discount,
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    fontSize: 10,
                  ),
                ),
                Text(
                  widget.price,
                ),
                Container(
                  width: 200,
                  height: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: LinearProgressIndicator(
                    value: _progressValue,
                    backgroundColor: Colors.transparent,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  widget.desc,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            width: w * 0.15,
            height: w * 0.09,
            child: TextButton(
              onPressed: () {},
              child: Text(
                'BUY',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Color(0xffD9d9d9),
                    offset: Offset(0, 3),
                    blurRadius: 4,
                    spreadRadius: 1),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class FlashSaleTimerWidget extends StatefulWidget {
  final DateTime endTime;

  FlashSaleTimerWidget({required this.endTime});

  @override
  _FlashSaleTimerWidgetState createState() => _FlashSaleTimerWidgetState();
}

class _FlashSaleTimerWidgetState extends State<FlashSaleTimerWidget> {
  late Timer _timer;
  Duration _duration = Duration();

  @override
  void initState() {
    super.initState();
    _duration = widget.endTime.difference(DateTime.now());
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _duration = widget.endTime.difference(DateTime.now());
        if (_duration.isNegative) {
          _timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Text(
      "${_duration.inHours.toString().padLeft(2, '0')} : ${_duration.inMinutes.remainder(60).toString().padLeft(2, '0')} : ${_duration.inSeconds.remainder(60).toString().padLeft(2, '0')}",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: w * 0.045,
        color: Colors.white,
      ),
    );
  }
}
