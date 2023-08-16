import 'package:authentic_guards/auth/login.dart';
import 'package:authentic_guards/pages/editProfile.dart';
import 'package:authentic_guards/pages/privacy.dart';
import 'package:authentic_guards/utils/payment/mypayment.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    void logout() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return PageLogin();
          },
        ),
      );
    }

    void _payment() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return Mypayment();
          },
        ),
      );
    }

    void _editProfile() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return editProfile();
          },
        ),
      );
    }

    void privacy() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return PagePrivacy();
          },
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 5,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
            gradient: RadialGradient(
              colors: [Colors.white, Color.fromARGB(255, 58, 57, 57)],
              center: Alignment.topCenter,
              radius: 10,
            ),
          ),
        ),
        toolbarHeight: w * 0.16,
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
              fontSize: w * 0.04,
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
                  padding: EdgeInsets.only(top: h * 0.045),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Container(
                              height: w * 0.2,
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
                              height: w * 0.15,
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
            padding: EdgeInsets.only(top: w * 0.04, left: w * 0.055),
            margin: EdgeInsets.only(right: w * 0.14),
            child: Column(
              children: [
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: w * 0.35,
                        child: Text(
                          'Asep Saefuddin',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: w * 0.06,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      VerticalDivider(
                        thickness: w * 0.0065,
                        width: w * 0.15,
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Sultan Collector',
                              style: TextStyle(
                                fontSize: w * 0.03,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              '70/100',
                              style: TextStyle(
                                fontSize: w * 0.025,
                              ),
                            ),
                            Text(
                              'active junee',
                              style: TextStyle(
                                fontSize: w * 0.025,
                              ),
                            ),
                            Text(
                              '6 mount ego',
                              style: TextStyle(
                                fontSize: w * 0.025,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: w * 0.0065,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: w * 0.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: w * 0.03),
                  child: Text(
                    'General',
                    style: TextStyle(
                      fontSize: w * 0.03,
                      color: Colors.grey,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                _itemList(
                  title: 'Payment',
                  image: 'assets/other/payment.png',
                  color: Color(0xff225849),
                  page: _payment,
                ),
                _itemList(
                  title: 'Owned',
                  image: 'assets/other/owned.png',
                  color: Color(0xffff9500),
                  page: privacy,
                ),
                _itemList(
                  title: 'Privasi',
                  image: 'assets/other/security.png',
                  color: Color(0xff9999a6),
                  page: privacy,
                ),
                Container(
                  padding: EdgeInsets.only(top: w * 0.05),
                  child: Text(
                    'My Account',
                    style: TextStyle(
                      fontSize: w * 0.03,
                      color: Colors.grey,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  child: _textButton(
                    title: 'Edit Profile',
                    color: Color(0xff9999a6),
                    nav: _editProfile,
                  ),
                ),
                Container(
                  child: _textButton(
                    title: 'Help',
                    color: Color(0xff007aff),
                    nav: logout,
                  ),
                ),
                Container(
                  child: _textButton(
                    title: 'Log Out',
                    color: Color(0xffff3b30),
                    nav: logout,
                  ),
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
  final VoidCallback nav;
  _textButton({
    super.key,
    required this.title,
    required this.color,
    required this.nav,
  });

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(top: w * 0.025),
      child: TextButton(
        onPressed: () {
          nav();
        },
        child: Text(
          title,
        ),
        style: TextButton.styleFrom(
          alignment: Alignment.topLeft,
          primary: color,
          textStyle: TextStyle(
            fontSize: w * 0.04,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class _itemList extends StatelessWidget {
  final String title;
  final String image;
  final Color color;
  final VoidCallback page;

  const _itemList({
    super.key,
    required this.title,
    required this.image,
    required this.color,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: w * 0.05, right: w * 0.1),
          width: w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: color,
                    radius: w * 0.055,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(image),
                      backgroundColor: Colors.transparent,
                      radius: w * 0.03,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: w * 0.05),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: w * 0.04,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: w * 0.15,
                height: w * 0.06,
                child: ElevatedButton(
                  onPressed: () {
                    page();
                  },
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: w * 0.02,
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Color(0xff9999a6),
                    ),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(w * 0.9),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
