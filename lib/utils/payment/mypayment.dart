import 'package:flutter/material.dart';

class Mypayment extends StatelessWidget {
  const Mypayment({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 5,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black, size: w * 0.05),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.vertical(bottom: Radius.circular(w * 0.1)),
            gradient: RadialGradient(
              colors: [Colors.white, Color.fromARGB(255, 58, 57, 57)],
              center: Alignment.topCenter,
              radius: w * 0.055,
            ),
          ),
        ),
        toolbarHeight: w * 0.16,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(w * 0.1),
          ),
        ),
        title: Text(
          'My Payment',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: w * 0.04,
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            child: Column(
              children: [
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  clipBehavior: Clip.antiAlias,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _card(
                        title: 'AGcoin',
                        logo: 'assets/other/logocard.png',
                        background: 'assets/other/bgAGcoin.png',
                        cardExpiration: "08/2022",
                        cardNumber: "3546 7532 XXXX 9742",
                      ),
                      _card(
                        title: '',
                        logo: 'assets/other/logoovo.png',
                        background: 'assets/other/bgOvo.png',
                        cardExpiration: "05/2024",
                        cardNumber: "9874 4785 XXXX 6548",
                      ),
                      _card(
                        title: 'gopay',
                        logo: 'assets/other/logogojek.png',
                        background: 'assets/other/bgGopay.png',
                        cardExpiration: "08/2022",
                        cardNumber: "3546 7532 XXXX 9742",
                      ),
                      _buildAddCardButton()
                    ],
                  ),
                ),
                Container(
                  child: Column(children: [
                    list(IconText: "A", Text1: "Text1", Text2: "Text2"),
                    list(IconText: "S", Text1: "Text1", Text2: "Text2"),
                    list(IconText: "E", Text1: "Text1", Text2: "Text2"),
                    list(IconText: "P", Text1: "Text1", Text2: "Text2"),
                    list(IconText: "S", Text1: "Text1", Text2: "Text2"),
                    list(IconText: "J", Text1: "Text1", Text2: "Text2"),
                    list(IconText: "Z", Text1: "Text1", Text2: "Text2"),
                    list(IconText: "0", Text1: "Text1", Text2: "Text2"),
                    list(IconText: "3", Text1: "Text1", Text2: "Text2"),
                    list(IconText: "3", Text1: "Text1", Text2: "Text2"),
                  ]),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _card extends StatelessWidget {
  final String title;
  final String background;
  final String logo;
  final String cardNumber;
  final String cardExpiration;

  const _card({
    required this.logo,
    required this.title,
    required this.background,
    required this.cardNumber,
    required this.cardExpiration,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(w * 0.085),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(14)),
          image: DecorationImage(
            image: AssetImage(background),
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),
        child: Card(
          elevation: 10,
          color: Colors.transparent,
          child: Container(
            height: w * 0.52,
            width: w * 0.8,
            padding: EdgeInsets.all(w * 0.055),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: w * 0.035,
                      ),
                    ),
                    Container(
                      width: w * 0.30,
                      height: w * 0.10,
                      child: Image.asset(
                        logo,
                        alignment: Alignment.centerRight,
                      ),
                    ),
                  ],
                ),
                Container(
                    padding: EdgeInsets.only(top: w * 0.05, bottom: w * 0.03),
                    child: Image.asset(
                      'assets/other/smartchip.png',
                      width: w * 0.095,
                    )),
                Text(
                  cardNumber,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: w * 0.065,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: w * 0.01),
                  child: Text(
                    cardExpiration,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: w * 0.03,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _buildAddCardButton extends StatelessWidget {
  const _buildAddCardButton({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(w * 0.085),
      color: Colors.white,
      alignment: Alignment.center,
      child: InkWell(
        onTap: () {
          print('Add New Card');
        },
        child: Card(
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          child: Container(
            height: w * 0.52,
            width: w * 0.8,
            padding: EdgeInsets.all(w * 0.055),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    'AddNewCard',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: w * 0.035,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: w * 0.05, bottom: w * 0.03),
                      child: Image.asset(
                        'assets/other/smartchipblack.png',
                        width: w * 0.095,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: w * 0.12),
                      child: Icon(
                        Icons.add,
                        color: Colors.grey,
                        size: w * 0.3,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(top: w * 0.01),
                  child: Text(
                    'XX/XX',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: w * 0.03,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class list extends StatelessWidget {
  final String IconText;
  final String Text1;
  final String Text2;
  list({
    Key? key,
    required this.IconText,
    required this.Text1,
    required this.Text2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          height: w * 0.2,
          child: InkWell(
            onTap: () {},
            child: Container(
              width: w,
              height: h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: w * 0.15,
                    width: w * 0.15,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      IconText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: w * 0.12,
                      ),
                    ),
                  ),
                  Container(
                    width: w * 0.7,
                    padding: EdgeInsets.all(w * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          Text1,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: w * 0.04,
                          ),
                        ),
                        Text(
                          Text2,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: w * 0.035,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Divider(
          thickness: 2,
        ),
      ],
    );
  }
}
