import 'package:flutter/material.dart';
import 'package:authentic_guards/pages/profile/appBar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'myCart.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class BlastSalesPage extends StatefulWidget {
  @override
  _BlastSalesPageState createState() => _BlastSalesPageState();
}

class _BlastSalesPageState extends State<BlastSalesPage> {
  // Daftar tampilan
  List<Widget> contents = [
    tampilan1(),
    tampilan2(),
    tampilan3(),
    tampilan4(),
  ];

  // Indeks tampilan saat ini
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: w * 0.005,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black, size: w * 0.065),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.vertical(bottom: Radius.circular(w * 0.05)),
            gradient: RadialGradient(
              colors: [Colors.white, Color.fromARGB(255, 58, 57, 57)],
              center: Alignment.topCenter,
              radius: w * 0.02,
            ),
          ),
        ),
        toolbarHeight: w * 0.2,
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyCart(cartItems: []),
                    ),
                  );
                },
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
                        padding:
                            EdgeInsets.only(right: w * 0.02, top: w * 0.025),
                        width: w * 0.28,
                        height: w * 0.18,
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
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.zero,
                                    bottomRight: Radius.zero,
                                    topLeft: Radius.circular(w * 0.05),
                                    topRight: Radius.circular(
                                      w * 0.05,
                                    )), // Mengatur radius
                              ),
                            ),
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (_currentIndex == index)
                                  return Colors
                                      .red; // Warna latar belakang saat aktif
                                return Colors
                                    .grey; // Warna latar belakang default
                              },
                            ),
                          ),
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

class SaleItems extends StatefulWidget {
  const SaleItems({
    super.key,
    required this.itemname,
    required this.discount,
    required this.price,
    required this.desc,
    required this.progressValue,
  });

  final String itemname;
  final String discount;
  final String price;
  final String desc;
  final double progressValue;

  @override
  State<SaleItems> createState() => _SaleItemsState();
}

class _SaleItemsState extends State<SaleItems> {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(top: w * 0.02, left: w * 0.02, right: w * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            width: w * 0.45,
            height: w * 0.30,
            decoration: BoxDecoration(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.itemname,
                  style: TextStyle(
                    fontSize: w * 0.05,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'Garment dyed Hoodie',
                  style: TextStyle(fontSize: w * 0.04),
                ),
                Text(
                  widget.discount,
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    fontSize: w * 0.03,
                  ),
                ),
                Text(
                  widget.price,
                  style: TextStyle(fontSize: w * 0.04, color: Colors.red),
                ),
                Container(
                  width: w * 0.45,
                  height: w * 0.04,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(w * 0.5),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        LinearProgressIndicator(
                          value: widget.progressValue,
                          backgroundColor: Colors.transparent,
                          borderRadius: BorderRadius.circular(w * 0.05),
                          minHeight: w * 0.035,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.grey),
                        ),
                        Text(
                            '${(widget.progressValue * 100).toStringAsFixed(1)}%',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: w * 0.03,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: w * 0.15,
            height: w * 0.09,
            child: TextButton(
              onPressed: widget.progressValue == 0.0
                  ? null // tombol tidak dapat ditekan
                  : () {
                      // kode yang dijalankan ketika tombol ditekan
                    },
              child: Text(
                'BUY',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: w * 0.04,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: widget.progressValue == 0 ? Colors.grey : Colors.red,
              borderRadius: BorderRadius.circular(w * 0.02),
              boxShadow: [
                BoxShadow(
                  color: Color(0xffD9d9d9),
                  offset: Offset(0, 3),
                  blurRadius: w * 0.04,
                  spreadRadius: w * 0.01,
                ),
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
            progressValue: 0.5,
          ),
          SaleItems(
            itemname: 'PANCOAT HOODIE',
            discount: 'Rp 699.999.999',
            price: 'Rp 399.399.999',
            desc: 'Limited Stok',
            progressValue: 0,
          ),
          SaleItems(
            itemname: 'BUTTERFLY HOODIE',
            discount: 'Rp 899.999.999',
            price: 'Rp 699.999.999',
            desc: '30 Sold',
            progressValue: 0.7,
          ),
          SaleItems(
            itemname: 'DRAGON HOODIE',
            discount: 'Rp 399.999.999',
            price: 'Rp 200.000.000',
            desc: '1 Sold',
            progressValue: 1,
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
            progressValue: 0.1,
          ),
          SaleItems(
            itemname: 'PANCOAT HOODIE',
            discount: 'Rp 699.999.999',
            price: 'Rp 399.399.999',
            desc: 'Limited Stok',
            progressValue: 0,
          ),
          SaleItems(
            itemname: 'BUTTERFLY HOODIE',
            discount: 'Rp 899.999.999',
            price: 'Rp 699.999.999',
            desc: '30 Sold',
            progressValue: 0.4,
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
            progressValue: 0,
          ),
          SaleItems(
            itemname: 'PANCOAT HOODIE',
            discount: 'Rp 699.999.999',
            price: 'Rp 399.399.999',
            desc: 'Limited Stok',
            progressValue: 0.6,
          ),
        ],
      ),
    );
  }
}

class tampilan4 extends StatelessWidget {
  const tampilan4({
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
            progressValue: 0.8,
          ),
          SaleItems(
            itemname: 'PANCOAT HOODIE',
            discount: 'Rp 699.999.999',
            price: 'Rp 399.399.999',
            desc: 'Limited Stok',
            progressValue: 0,
          ),
          SaleItems(
            itemname: 'BUTTERFLY HOODIE',
            discount: 'Rp 799.999.99',
            price: 'Rp 499.999.999',
            desc: '28 Sold',
            progressValue: 0.1,
          ),
          SaleItems(
            itemname: 'PANCOAT HOODIE',
            discount: 'Rp 699.999.999',
            price: 'Rp 399.399.999',
            desc: 'Limited Stok',
            progressValue: 0.9,
          ),
          SaleItems(
            itemname: 'PANCOAT HOODIE',
            discount: 'Rp 699.999.999',
            price: 'Rp 399.399.999',
            desc: 'Limited Stok',
            progressValue: 1,
          ),
          SaleItems(
            itemname: 'PANCOAT HOODIE',
            discount: 'Rp 699.999.999',
            price: 'Rp 399.399.999',
            desc: 'Limited Stok',
            progressValue: 0,
          ),
          SaleItems(
            itemname: 'PANCOAT HOODIE',
            discount: 'Rp 699.999.999',
            price: 'Rp 399.399.999',
            desc: 'Limited Stok',
            progressValue: 0,
          ),
        ],
      ),
    );
  }
}
