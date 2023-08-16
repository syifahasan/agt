import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaySlidingMenu extends StatefulWidget {
  final PanelController panelController;
  PaySlidingMenu({Key? key, required this.panelController});

  @override
  State<PaySlidingMenu> createState() => _PaySlidingMenuState();
}

class _PaySlidingMenuState extends State<PaySlidingMenu> {
  bool _isFirstPanelVisible = true;

  void _togglePanels() {
    if (_isFirstPanelVisible) {}
    setState(() {
      _isFirstPanelVisible = !_isFirstPanelVisible;
      print('button tapped');
    });
  }

  @override
  Widget build(BuildContext context) {
    final panelHeightOpen = MediaQuery.of(context).size.height * 0.7;

    return Stack(
      children: [
        SlidingUpPanel(
          controller: widget.panelController,
          maxHeight: panelHeightOpen,
          backdropEnabled: true,
          defaultPanelState: PanelState.CLOSED,
          minHeight: 0,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          backdropTapClosesPanel: true,
          panelBuilder: (sc) => PayPanel(
            method: _togglePanels,
            sc: sc,
            pc: widget.panelController,
          ),
        ),
        SlidingUpPanel(
          controller: widget.panelController,
          maxHeight: panelHeightOpen,
          backdropEnabled: true,
          defaultPanelState: PanelState.CLOSED,
          minHeight: 0,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          backdropTapClosesPanel: true,
          panelBuilder: (sc) => FriendsPanel(
            method: _togglePanels,
            sc: sc,
            pc: widget.panelController,
          ),
        ),
      ],
    );
  }
}

class PayPanel extends StatelessWidget {
  PayPanel(
      {super.key, required this.sc, required this.pc, required this.method});

  ScrollController sc;
  PanelController pc;
  VoidCallback method;

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ElevatedButton(
            onPressed: () {
              method;
            },
            child: Text('Navigate')));
  }
}

class FriendsPanel extends StatelessWidget {
  FriendsPanel({
    super.key,
    required this.sc,
    required this.pc,
    required this.method,
  });

  ScrollController sc;
  PanelController pc;
  VoidCallback method;

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView(
        controller: sc,
        children: [
          SizedBox(
            height: 12.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  if (pc.isAttached == true) {
                    print('button tapped');
                    pc.close();
                  } else {
                    print('panel still closed');
                  }
                },
                child: Container(
                  width: 30,
                  height: 5,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.all(Radius.circular(12.0))),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Text(
                  'Pay and Send',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 40,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: TextField(
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(50)),
                  filled: true,
                  prefixIconColor: Colors.grey[850],
                  fillColor: Colors.grey[350],
                  hintText: 'Type a name or phone number to send',
                  hintStyle: TextStyle(
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text("YOUR CONTACT FRIENDS"),
          ),
          Divider(
            thickness: 2,
            indent: 20,
            endIndent: 20,
          ),
          ContactList(
            name: 'Aa',
            method: method,
          ),
          ContactList(
            name: 'Bb',
            method: method,
          ),
          ContactList(
            name: 'Cc',
            method: method,
          ),
          ContactList(
            name: 'Dd',
            method: method,
          ),
          ContactList(
            name: 'Ee',
            method: method,
          ),
          ContactList(
            name: 'Ee',
            method: method,
          ),
          ContactList(
            name: 'Ee',
            method: method,
          ),
        ],
      ),
    );
  }
}

class ContactList extends StatelessWidget {
  ContactList({
    super.key,
    required this.name,
    required this.method,
  });
  String name;
  VoidCallback method;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          GestureDetector(
            onTap: method,
            child: Container(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10, top: 8, bottom: 8),
                    child: Container(
                        height: 40,
                        width: 40,
                        child:
                            // SvgPicture.asset('assets/icons/payment/contactpic.svg'),
                            CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/icons/payment/PPict.png'),
                        )),
                  ),
                  Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          Divider(
            thickness: 2,
          ),
        ],
      ),
    );
  }
}
