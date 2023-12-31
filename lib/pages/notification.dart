import 'package:flutter/material.dart';
import 'package:authentic_guards/pages/profile/appBar.dart';

class NotifPage extends StatelessWidget {
  const NotifPage({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: CustomAppBar(title: 'Notification', iconbar: true),
        body: Container(
            padding: EdgeInsets.only(top: w * 0.05),
            child: ListView(
              children: [
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
                    height: w * 0.14,
                    width: w * 0.14,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(w * 0.02)),
                    child: Text(
                      IconText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: w * 0.11,
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
