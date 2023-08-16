import 'package:flutter/material.dart';
import 'package:authentic_guards/utils/appBar.dart';

class PagePrivacy extends StatelessWidget {
  const PagePrivacy({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(
        title: 'My Privacy',
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(top: 10, left: w * 0.1, right: w * 0.01),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 30),
                  child: Text(
                    'Privasi Setting',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.019,
                      color: Colors.grey,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  child: _itemList(
                    title: 'Change Password',
                    image: 'assets/other/password.png',
                    color: Color(0xffc75c5c),
                  ),
                ),
                Container(
                  child: _itemList(
                    title: 'Change PIN',
                    image: 'assets/other/pin.png',
                    color: Color(0xffe0e0d1),
                  ),
                ),
                Container(
                  child: _itemList(
                    title: 'Face Id',
                    image: 'assets/other/faceid.png',
                    color: Color(0xff4f5d73),
                  ),
                )
              ],
            ),
          )
        ],
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
                  onPressed: () {},
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
