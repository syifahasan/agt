import 'package:flutter/material.dart';

class PagePrivacy extends StatelessWidget {
  const PagePrivacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 5,
        iconTheme: IconThemeData(color: Colors.black),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
              gradient: RadialGradient(
                colors: [Colors.white, Color.fromARGB(255, 58, 57, 57)],
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
        title: Text(
          'Privacy',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(top: 10, left: 20, right: 49),
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
                  padding: EdgeInsets.only(top: 20),
                  child: _item_list(
                    title: 'Change Password',
                    image: 'assets/other/password.png',
                    color: Color(0xffc75c5c),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: _item_list(
                    title: 'Change PIN',
                    image: 'assets/other/pin.png',
                    color: Color(0xffe0e0d1),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: _item_list(
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

class _item_list extends StatelessWidget {
  final String title;
  final String image;
  final Color color;
  // final VoidCallback page;
  const _item_list({
    super.key,
    required this.title,
    required this.image,
    required this.color,
    // required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  radius: 20,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 25),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.022,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
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
        ],
      ),
    );
  }
}
