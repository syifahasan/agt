import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TransactionHistory extends StatelessWidget {
  TransactionHistory(
      {super.key,
      required this.hari,
      required this.tanggal,
      required this.desc1,
      required this.desc2,
      required this.status,
      required this.nominal});

  String hari;
  String tanggal;
  int status;
  String desc1;
  String desc2;
  String nominal;

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final screenWidth = mediaQueryData.size.width;
    final screenHeight = mediaQueryData.size.height;
    return Column(
      children: [
        Date(day: hari, date: tanggal),
        TransactionDesc(
            screenWidth: screenWidth,
            condition: status,
            desc1: desc1,
            desc2: desc2,
            nominal: nominal),
      ],
    );
  }
}

class TransactionDesc extends StatelessWidget {
  TransactionDesc(
      {super.key,
      required this.screenWidth,
      required this.condition,
      required this.desc1,
      required this.desc2,
      required this.nominal});

  final double screenWidth;
  String desc1;
  String desc2;
  String nominal;
  int condition;
  // Map<String, String> transactionItem = {};

  SvgPicture _getIcon() {
    if (condition == 1) {
      return SvgPicture.asset('assets/icons/payment/PlusBalance.svg');
    } else if (condition == 2) {
      return SvgPicture.asset('assets/icons/payment/MinusBalance.svg');
    } else {
      return SvgPicture.asset('assets/icons/payment/PendingBalance.svg');
    }
  }

  Widget? _getNominal() {
    if (condition == 1) {
      return Text(
        'Rp ${nominal}',
        style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
      );
    } else if (condition == 2) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '- Rp ${nominal}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              SvgPicture.asset('assets/icons/payment/AGPointLogo.svg'),
              Text(
                'AG Points',
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.grey,
                    ),
                    child: _getIcon(),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        desc1,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      Text(desc2),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: _getNominal(),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 9),
          child: Divider(
            color: Color.fromARGB(129, 217, 217, 217),
            thickness: 1.5,
            indent: screenWidth * 24 / 100,
            endIndent: screenWidth * 5 / 100,
          ),
        ),
      ],
    );
  }
}

class Date extends StatelessWidget {
  Date({
    super.key,
    required this.day,
    required this.date,
  });
  String day;
  String date;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 28,
            horizontal: 20,
          ),
          child: Row(
            children: [
              Text(day,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              Text(', ',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              Text(date,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ]),
    );
  }
}
