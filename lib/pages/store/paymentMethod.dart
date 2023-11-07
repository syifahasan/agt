import 'package:authentic_guards/utils/payment/topUpMethod.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbols.dart';
import 'package:intl/intl.dart';
import 'dart:math';
import 'package:authentic_guards/utils/payment/currencyFormat.dart';
import 'package:authentic_guards/utils/provider/cartProvider.dart';
import 'package:provider/provider.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key, required this.orderNumber});
  final String orderNumber;

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final screenWidth = mediaQueryData.size.width;
    final screenHeight = mediaQueryData.size.height;
    final currentDate = DateTime.now();
    final parsedDate = DateFormat('d MMMM y', 'en_US').format(currentDate);
    final parsedTime = DateFormat.Hm().format(currentDate);

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            iconTheme:
                IconThemeData(color: Colors.white, size: screenWidth * 0.065),
            backgroundColor: Colors.transparent,
            // Properties for the AppBar
            expandedHeight:
                screenHeight * 20 / 100, // Set the desired height of the AppBar
            pinned: false, // Set this to false to make AppBar non-sticky
            flexibleSpace: Container(
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 100, left: 30),
                    height: screenHeight * 20 / 100,
                    // A container for the flexible space (background) of the AppBar
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                    child: Container(
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'PAYMENT METHOD',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth * 0.075,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // SliverList to contain the scrollable content
          SliverToBoxAdapter(
            child: ClipPath(
              clipper: MyClipPath(),
              child: Container(
                padding: EdgeInsets.only(
                  top: 90,
                ),
                width: screenWidth,
                height: screenHeight,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Container(
                      width: 300,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.grey[350],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Payment Method',
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
                            ),
                            Text(
                              'AGcoin',
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Order payment via AGT pay',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Order number: $orderNumber',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      width: 300,
                      height: 140,
                      decoration: BoxDecoration(
                        color: Colors.grey[350],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OrderInfo(
                          time: parsedTime,
                          date: parsedDate,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Enter your PIN to continue payment',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 10),
                    PinInputField(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        height: screenWidth * 45 / 100,
        width: screenWidth,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Divider(
              indent: 20,
              endIndent: 20,
              thickness: 1.5,
            ),
            Container(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.08, right: screenWidth * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text('Total'),
                  ),
                  Container(
                    child: Consumer<CartProvider>(
                      builder: (context, cartProvider, child) {
                        final cartItems = cartProvider.items;
                        final totalPrice = cartProvider.totalPrice;
                        return Text(
                          CurrencyFormat.convertToIdr(totalPrice, 2),
                          style: TextStyle(fontWeight: FontWeight.w700),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            FloatingActionButton.extended(
              backgroundColor: Color(0xffFF6161),
              onPressed: () {},
              label: Container(
                width: screenWidth * 70 / 100,
                child: Center(
                  child: Text(
                    'Continue Payment',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class OrderInfo extends StatelessWidget {
  const OrderInfo({
    super.key,
    required this.time,
    required this.date,
  });

  final String time;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Text(
          'Order date : $date',
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Time : $time',
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Order : Butterfly T-shirt, Size M',
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Amount : 1pcs',
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

class MyClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path = Path();
    path.moveTo(0, h); // Starting point (bottom-left corner)
    path.lineTo(0, 80); // Left side
    path.quadraticBezierTo(
        w * 0.5, 0, w, 80); // Top with quadratic Bezier curve
    path.lineTo(w, h); // Right side
    path.close(); // Complete the shape
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class PinInputField extends StatefulWidget {
  @override
  _PinInputFieldState createState() => _PinInputFieldState();
}

class _PinInputFieldState extends State<PinInputField> {
  TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 300,
          height: 70,
          decoration: BoxDecoration(
            color: Colors.grey[350],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: TextFormField(
              textAlign: TextAlign.center,
              controller: pinController,

              keyboardType: TextInputType.number,
              maxLength: 6, // Jumlah karakter PIN (4 digit)

              obscureText: true, // Sembunyikan input seperti kata sandi
              decoration: InputDecoration(
                hintText: '',
                counterText: '',
                border: InputBorder.none,
              ),
              style: TextStyle(
                fontSize: 90.0, // Atur ukuran teks
              ),
            ),
          ),
        ),
        SizedBox(height: 20.0),
        // ElevatedButton(
        //   onPressed: () {
        //     // Lakukan sesuatu dengan nilai PIN yang dimasukkan, contohnya validasi
        //     String pin = pinController.text;
        //     if (pin.length == 6) {
        //       // Validasi PIN
        //       print('PIN yang dimasukkan: $pin');
        //     } else {
        //       print('PIN harus memiliki 6 digit');
        //     }
        //   },
        //   child: Text('Submit'),
        // ),
      ],
    );
  }
}
