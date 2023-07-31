import 'package:authentic_guards/utils/navigationBar.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
              gradient: RadialGradient(
                colors: [Colors.white, Color.fromARGB(255, 233, 144, 144)],
                center: Alignment.topCenter,
                radius: 10,
              )),
        ),
        toolbarHeight: 80,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        title: Center(
          child: Text(
            'My Profile',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 25),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image(
                                  image:
                                      AssetImage('assets/other/profile1.png'),
                                  fit: BoxFit.fill),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              height: 80,
                              margin: EdgeInsets.only(top: 20),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image(
                                  image:
                                      AssetImage('assets/other/profile2.png'),
                                  fit: BoxFit.fill),
                            ),
                            Container(
                              decoration: BoxDecoration(),
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
          Container(
            padding: EdgeInsets.only(left: 25, right: 25, top: 10),
            child: Column(
              children: [
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.34,
                        child: Text(
                          'Asep Saefuddin',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * 0.04,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      VerticalDivider(
                        thickness: 2,
                        width: MediaQuery.of(context).size.width * 0.15,
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Sultan Collector',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              '70/100',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text('active junee'),
                            Text('6 mount ego')
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 2,
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 20, left: 50),
                  child: Text(
                    'General',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                _itemList(
                  title: 'Payment',
                  image: 'assets/other/payment.png',
                  color: Color(0xff225849),
                ),
                _itemList(
                  title: 'Owned',
                  image: 'assets/other/owned.png',
                  color: Color(0xffff9500),
                ),
                _itemList(
                  title: 'Security',
                  image: 'assets/other/security.png',
                  color: Color(0xff9999a6),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20, left: 50),
                  child: Text(
                    'My Account',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                _textButton(
                  title: 'Edit Profile',
                  color: Color(0xff9999a6),
                ),
                _textButton(
                  title: 'Help',
                  color: Color(0xff007aff),
                ),
                _textButton(
                  title: 'Log Out',
                  color: Color(0xffff3b30),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _textButton extends StatelessWidget {
  final String title;
  final Color color;
  const _textButton({
    super.key,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 40),
      child: TextButton(
        onPressed: () {},
        child: Text(title),
        style: TextButton.styleFrom(
          primary: color,
          textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}

class _itemList extends StatelessWidget {
  final String title;
  final String image;
  final Color color;

  const _itemList({
    super.key,
    required this.title,
    required this.image,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 10, left: 42, right: 49),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: color,
                    radius: 30,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(image),
                      backgroundColor: Colors.transparent,
                      radius: 15,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 25),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.12,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Icon(Icons.arrow_forward_ios, size: 15),
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Color(0xff9999a6),
                    ),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 12,
        )
      ],
    );
  }
}
