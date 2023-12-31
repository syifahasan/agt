import 'package:flutter/material.dart';
import 'package:authentic_guards/pages/profile/appBar.dart';

class MyBadgePage extends StatefulWidget {
  const MyBadgePage({super.key});

  @override
  State<MyBadgePage> createState() => _MyBadgePageState();
}

class _MyBadgePageState extends State<MyBadgePage> {
  String? _selected = 'All';
  final List<String> _list = ['Done', 'Undone', 'All'];
  bool _viewAll = false;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(title: 'My Badge'),
      body: ListView(
        children: [
          ImageInCircularProgressIndicator(),
          Container(
            padding: EdgeInsets.all(w * 0.05),
            child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text('Achivements',
                            style: TextStyle(
                                fontSize: w * 0.04,
                                fontWeight: FontWeight.w700)),
                      ),
                      Container(
                        width: w * 0.25,
                        height: w * 0.055,
                        padding: EdgeInsets.all(w * 0.005),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xff474952),
                          ),
                          borderRadius: BorderRadius.circular(w * 0.008),
                        ),
                        child: Expanded(
                          child: Container(
                            padding: EdgeInsets.only(
                                left: w * 0.01, right: w * 0.01),
                            color: Colors.grey,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                isExpanded: true,
                                dropdownColor: Colors.white,
                                value: _selected,
                                style: TextStyle(
                                  fontSize: w * 0.03,
                                  color: Color(0xff474952),
                                ),
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.black,
                                  size: w * 0.045,
                                ),
                                items: _list
                                    .map((list) => DropdownMenuItem<String>(
                                        value: list, child: Text(list)))
                                    .toList(),
                                onChanged: (String? newValue) {
                                  setState(
                                    () {
                                      _selected = newValue;
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (_selected == 'Done')
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
                if (_selected == 'Undone')
                  Container(
                    child: Column(children: [
                      list(IconText: "P", Text1: "Text1", Text2: "Text2"),
                      list(IconText: "S", Text1: "Text1", Text2: "Text2"),
                      list(IconText: "J", Text1: "Text1", Text2: "Text2"),
                      list(IconText: "Z", Text1: "Text1", Text2: "Text2"),
                      list(IconText: "0", Text1: "Text1", Text2: "Text2"),
                      list(IconText: "3", Text1: "Text1", Text2: "Text2"),
                      list(IconText: "3", Text1: "Text1", Text2: "Text2"),
                    ]),
                  ),
                if (_selected == 'All')
                  Container(
                      child: Column(
                    children: [
                      list(IconText: "A", Text1: "Text1", Text2: "Text2"),
                      list(IconText: "S", Text1: "Text1", Text2: "Text2"),
                      list(IconText: "E", Text1: "Text1", Text2: "Text2"),
                      list(IconText: "P", Text1: "Text1", Text2: "Text2"),
                      list(IconText: "S", Text1: "Text1", Text2: "Text2"),
                      if (_viewAll)
                        Column(
                          children: [
                            list(IconText: "J", Text1: "Text1", Text2: "Text2"),
                            list(IconText: "Z", Text1: "Text1", Text2: "Text2"),
                            list(IconText: "0", Text1: "Text1", Text2: "Text2"),
                            list(IconText: "3", Text1: "Text1", Text2: "Text2"),
                            list(IconText: "3", Text1: "Text1", Text2: "Text2"),
                          ],
                        ),
                      TextButton(
                        child: Text(_viewAll ? 'View Less' : 'View All'),
                        onPressed: () {
                          setState(() {
                            _viewAll = !_viewAll;
                          });
                        },
                      ),
                    ],
                  )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ImageInCircularProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(top: w * 0.1),
      child: Column(
        children: [
          SizedBox(
            width: w * 0.25,
            height: w * 0.25,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CircularProgressIndicator(
                  value:
                      0.7, // nilai antara 0.0 dan 1.0, null untuk spinning indicator
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
                  strokeWidth: w * 0.02,
                ),
                Center(
                  child: Image.asset(
                    'assets/other/mybadge.png', // Gantikan dengan path ke gambar Anda
                    width: w * 0.17,
                    height: w * 0.17,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: w * 0.025),
            child: Text(
              '700/1000 pts',
              style: TextStyle(fontSize: w * 0.04, color: Color(0xff474952)),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: w * 0.01),
            child: Text(
              'Sultan Collector',
              style: TextStyle(
                  fontSize: w * 0.045,
                  color: Colors.black,
                  fontWeight: FontWeight.w700),
            ),
          )
        ],
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
