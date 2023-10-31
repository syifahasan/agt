import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:authentic_guards/auth/login.dart';
import 'package:authentic_guards/pages/profile/mybadge.dart';
import 'package:authentic_guards/pages/profile/mypayment.dart';
import 'package:authentic_guards/pages/profile/privacy.dart';
import 'package:authentic_guards/pages/profile/editProfile.dart';
import 'package:authentic_guards/pages/profile/appBar.dart';
import 'package:authentic_guards/pages/profile/owned.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final GoogleSignIn googleSignIn = GoogleSignIn();

    Future<void> signOut() async {
      await FirebaseAuth.instance.signOut();
    }

    Future<void> signOutGoogle() async {
      await googleSignIn.signOut();
      print("User Signed Out");
    }

    Future<void> signOutFromFacebook() async {
      try {
        await FirebaseAuth.instance.signOut();
        await FacebookAuth.instance.logOut();
        print("Logged out from Facebook successfully!");
      } catch (e) {
        print("Error logging out: $e");
      }
    }

    void owned() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return MyOwned();
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

    void launchWhatsApp(
        {required String phone, required String message}) async {
      String url() {
        if (phone[0] != '+') {
          phone = "+$phone";
        }
        return "whatsapp://send?phone=$phone&text=${Uri.parse(message)}";
      }

      if (!await canLaunch(url())) {
        await launch(url());
      } else {
        throw 'Could not launch $url';
      }
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
      appBar: CustomAppBar(title: 'My Profile'),
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
                        padding: EdgeInsets.only(left: w * 0.05),
                        child: Column(
                          children: [
                            Container(
                              height: w * 0.25,
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
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return MyBadgePage();
                              },
                            ),
                          );
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                height: w * 0.2,
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
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding:
                EdgeInsets.only(top: w * 0.04, left: w * 0.135, right: w * 0.1),
            child: Column(
              children: [
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: w * 0.25,
                        child: Text(
                          'Asep Saefuddin',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: w * 0.08,
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
                                fontSize: w * 0.045,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              '70/100',
                              style: TextStyle(
                                fontSize: w * 0.03,
                              ),
                            ),
                            Text(
                              'active junee',
                              style: TextStyle(
                                fontSize: w * 0.03,
                              ),
                            ),
                            Text(
                              '6 mounth ego',
                              style: TextStyle(
                                fontSize: w * 0.045,
                              ),
                            )
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
            padding: EdgeInsets.only(left: w * 0.075, right: w * 0.075),
            child: Column(
              children: [
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
                      fontSize: w * 0.04,
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
                  page: owned,
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
                      fontSize: w * 0.04,
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
                    nav: () => launchWhatsApp(
                        phone: '6281388988467',
                        message: 'Halo, Apakah anda bisa membantu saya?'),
                  ),
                ),
                Container(
                  child: _textButton(
                    title: 'Log Out',
                    color: Color(0xffff3b30),
                    nav: () async {
                      await signOut();
                      await signOutGoogle();
                      await signOutFromFacebook();
                      // Setelah logout, arahkan pengguna ke halaman login atau beranda, tergantung pada kebutuhan Anda.
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => PageLogin()));
                    },
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
            fontSize: w * 0.055,
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
                    radius: w * 0.07,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(image),
                      backgroundColor: Colors.transparent,
                      radius: w * 0.035,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: w * 0.05),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: w * 0.045,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: w * 0.15,
                height: w * 0.07,
                child: ElevatedButton(
                  onPressed: () {
                    page();
                  },
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: w * 0.03,
                    color: Colors.white,
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
