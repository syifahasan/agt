import 'package:authentic_guards/pages/profile/appBar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BlastSalesPage extends StatefulWidget {
  const BlastSalesPage({super.key});

  @override
  State<BlastSalesPage> createState() => _BlastSalesPageState();
}

class _BlastSalesPageState extends State<BlastSalesPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _searchController = TextEditingController();
    final mediaQueryData = MediaQuery.of(context);
    final w = mediaQueryData.size.width;
    final screenHeight = mediaQueryData.size.height;
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
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: SingleChildScrollView(
              // This next line does the trick.
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SaleTime(
                    w: w,
                    screenHeight: screenHeight,
                    time: '19.20',
                    text: 'Sedang berlangsung',
                  ),
                  SaleTime(
                    w: w,
                    screenHeight: screenHeight,
                    time: '20.00',
                    text: 'Akan datang',
                  ),
                  SaleTime(
                    w: w,
                    screenHeight: screenHeight,
                    time: '21.20',
                    text: 'Akan datang',
                  ),
                  SaleTime(
                    w: w,
                    screenHeight: screenHeight,
                    time: '22.00',
                    text: 'Akan datang',
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                SaleItems(
                  w: w,
                  itemname: 'BUTTERFLY HOODIE',
                  discount: 'Rp 799.999.99',
                  price: 'Rp 499.999.999',
                  desc: '28 Sold',
                ),
                SaleItems(
                  w: w,
                  itemname: 'PANCOAT HOODIE',
                  discount: 'Rp 699.999.999',
                  price: 'Rp 399.399.999',
                  desc: 'Limited Stok',
                ),
                SaleItems(
                  w: w,
                  itemname: 'BUTTERFLY HOODIE',
                  discount: 'Rp 899.999.999',
                  price: 'Rp 699.999.999',
                  desc: '30 Sold',
                ),
                SaleItems(
                  w: w,
                  itemname: 'DRAGON HOODIE',
                  discount: 'Rp 399.999.999',
                  price: 'Rp 200.000.000',
                  desc: '1 Sold',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SaleTime extends StatelessWidget {
  const SaleTime({
    super.key,
    required this.w,
    required this.screenHeight,
    required this.time,
    required this.text,
  });

  final double w;
  final double screenHeight;
  final String time;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(w * 0.05),
              topRight: Radius.circular(w * 0.05))),
      margin: EdgeInsets.only(left: 10),
      width: w * 0.25,
      height: screenHeight * 6 / 100,
      child: TextButton(
        style: ButtonStyle(
          foregroundColor:
              MaterialStateProperty.all<Color>(Colors.grey.shade400),
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered))
                return Colors.red..withOpacity(0.04);
              if (states.contains(MaterialState.focused) ||
                  states.contains(MaterialState.pressed))
                return Colors.red.withOpacity(0.12);
              return null; // Defer to the widget's default.
            },
          ),
        ),
        onPressed: () {},
        child: Column(
          children: [
            Align(
              alignment: AlignmentDirectional.bottomCenter,
            ),
            Text(
              time,
              style: TextStyle(
                fontSize: w * 0.050,
                color: Colors.white,
              ),
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: w * 0.022,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SaleItems extends StatefulWidget {
  const SaleItems({
    super.key,
    required this.w,
    required this.itemname,
    required this.discount,
    required this.price,
    required this.desc,
  });

  final double w;
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            width: widget.w * 30 / 100,
            height: widget.w * 30 / 100,
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
            width: widget.w * 45 / 100,
            height: widget.w * 30 / 100,
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
            width: widget.w * 15 / 100,
            height: widget.w * 9 / 100,
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
