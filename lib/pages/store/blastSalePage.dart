import 'package:authentic_guards/pages/profile/appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BlastSalesPage extends StatelessWidget {
  const BlastSalesPage({super.key});

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
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: SingleChildScrollView(
              // This next line does the trick.
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SaleTime(w, screenHeight),
                  SaleTime(w, screenHeight),
                  SaleTime(w, screenHeight),
                  SaleTime(w, screenHeight),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container SaleTime(double w, double screenHeight) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(w * 0.05),
              topRight: Radius.circular(w * 0.05))),
      margin: EdgeInsets.only(left: 10),
      width: w * 0.25,
      height: screenHeight * 6 / 100,
      child: Text(
        '19:28',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: w * 0.04,
          color: Colors.blueGrey,
        ),
      ),
    );
  }
}
