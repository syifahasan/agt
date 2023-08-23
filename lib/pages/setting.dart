import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:authentic_guards/pages/profile/appBar.dart';
import 'package:get/get.dart';

class settingPage extends StatelessWidget {
  const settingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(title: 'Notification Setting'),
      body: Container(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(w * 0.04),
              child: Column(
                children: [
                  _CustomListTile(
                    title: 'Pouse All',
                  ),
                  _CustomListTile(
                    title: 'Lates News',
                  ),
                  _CustomListTile(
                    title: 'Transaction',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final String title;
  final Widget? trailing;
  const _CustomListTile({Key? key, required this.title, this.trailing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: w * 0.05, fontWeight: FontWeight.w700),
      ),
      trailing: CupertinoSwitch(
        thumbColor: Color(0xff9999a4),
        activeColor: Colors.blueGrey,
        value: false,
        onChanged: (value) {},
      ),
      onTap: () {},
    );
  }
}
