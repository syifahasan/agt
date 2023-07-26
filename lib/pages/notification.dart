import 'package:flutter/material.dart';

class NotifPage extends StatelessWidget {
  const NotifPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 20,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(30)),
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
          title: Padding(
            padding: const EdgeInsets.only(bottom: 20, left: 39),
            child: Center(
              child: Text(
                'Notification',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Image.asset('assets/other/setting.png'),
              iconSize: 40,
              padding: EdgeInsets.only(right: 16),
            )
          ],
        ),
        body: Container(
            padding: EdgeInsets.only(top: 20),
            child: ListView(
              children: [
                Container(
                  child: Column(children: [
                    list(IconText: "A", Text1: "Text1", Text2: "Text2"),
                    list(IconText: "S", Text1: "Text1", Text2: "Text2"),
                  ]),
                ),
              ],
            )));
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
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  height: 53,
                  width: 53,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    IconText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(Text1,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        )),
                    Text(
                      Text2,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
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
    );
  }
}
