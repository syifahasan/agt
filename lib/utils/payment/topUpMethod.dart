import 'package:authentic_guards/pages/TopUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TopUpMethod extends StatefulWidget {
  const TopUpMethod({super.key, required this.slug});
  final String slug;

  @override
  State<TopUpMethod> createState() => _TopUpMethodState();
}

class _TopUpMethodState extends State<TopUpMethod> {
  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final screenWidth = mediaQueryData.size.width;
    final screenHeight = mediaQueryData.size.height;
    String textToCopy = '3901 081 0000 0000';
    void copyToClipboard(String textToCopy) {
      Clipboard.setData(ClipboardData(text: textToCopy));
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            // Properties for the AppBar
            expandedHeight:
                screenHeight * 15 / 100, // Set the desired height of the AppBar
            pinned: false, // Set this to false to make AppBar non-sticky
            flexibleSpace: Container(
              margin: EdgeInsets.only(top: 100, left: 30),
              height: screenHeight * 20 / 100,
              // A container for the flexible space (background) of the AppBar
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Container(
                padding: EdgeInsets.only(),
                child: Text(
                  'TOP UP',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.09,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ClipPath(
              clipper: MyClipPath(),
              child: Container(
                padding: EdgeInsets.only(
                  top: 120,
                  left: 30,
                  right: 30,
                ),
                width: screenWidth,
                // height: screenHeight + 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  // borderRadius: BorderRadius.vertical(
                  //   top: Radius.elliptical(200, 120),
                  // ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ChosedBank(
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      slug: widget.slug,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 35),
                      child: Text(
                        '${widget.slug} Virtual Account Number',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 4 / 100,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        textToCopy,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: screenWidth * 6 / 100,
                          color: Color(0xffFF6161),
                        ),
                      ),
                    ),
                    Container(
                      width: screenWidth * 40 / 100,
                      height: screenWidth * 13 / 100,
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.grey,
                          side: BorderSide(color: Colors.grey, width: 1),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: () {
                          copyToClipboard(textToCopy);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Text copied to clipboard')),
                          );
                        },
                        child: Text('COPY CODE'),
                      ),
                    ),
                    Text(
                      'Account Name: ASEP SAEFUDDIN',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: screenWidth * 4 / 100,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 25, bottom: 20),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text:
                              'Your maximum balance is 20.000.000. The maximum value of adding balance is Rp20.000.000. You can still add balance up to Rp15.655.000 this month',
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'SFProDisplay',
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, bottom: 20, right: 20),
                      width: screenWidth * 80 / 100,
                      child: RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          text: 'Please follow instructions below to Transfer:',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'SFProDisplay',
                            fontWeight: FontWeight.w600,
                            fontSize: screenWidth * 6 / 100,
                          ),
                        ),
                      ),
                    ),
                    Instructions(
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                      title: 'ATM ${widget.slug}',
                      desc: 'How to transfer from ATM',
                    ),
                    Instructions(
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                      title: 'KLIK ${widget.slug}',
                      desc: 'How to transfer from ATM',
                    ),
                    Instructions(
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                      title: 'm-${widget.slug} (${widget.slug} MOBILE)',
                      desc: 'How to transfer from ATM',
                    ),
                    Instructions(
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                      title: 'm-${widget.slug} (STK-SIM Tool Kit)',
                      desc: 'How to transfer from ATM',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Instructions extends StatefulWidget {
  const Instructions({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.desc,
    required this.title,
  });
  final double screenWidth;
  final double screenHeight;
  final String desc;
  final String title;

  @override
  State<Instructions> createState() => _InstructionsState();
}

class _InstructionsState extends State<Instructions> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final screenWidth = mediaQueryData.size.width;
    final screenHeight = mediaQueryData.size.height;
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                // IconButton(
                //   onPressed: () {},
                //   icon: Icon(Icons.keyboard_arrow_down_rounded),
                // ),
                AnimatedSwitcher(
                  duration: Duration(
                    milliseconds: 300,
                  ),
                  child: _isExpanded
                      ? Icon(Icons.keyboard_arrow_up_rounded)
                      : Icon(Icons.keyboard_arrow_down_rounded),
                )
              ],
            ),
          ),
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 300),
          height: _isExpanded ? _getContentHeight(context) : 0,
          child: Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.all(10),
            width: screenWidth,
            decoration: BoxDecoration(
                // border: Border.all(color: Colors.grey),
                // borderRadius: BorderRadius.circular(4),
                ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.desc),
              ],
            ),
          ),
        ),
        Divider(
          thickness: 2,
        ),
      ],
    );
  }

  double _getContentHeight(BuildContext context) {
    // Calculate the content height based on its layout
    return MediaQuery.of(context).size.height *
        0.3; // You can adjust this value
  }
}

class ChosedBank extends StatelessWidget {
  const ChosedBank({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.slug,
  });

  final double screenWidth;
  final double screenHeight;
  final String slug;

  _getBank() {
    if (slug == 'BCA') {
      return Image.asset('assets/icons/payment/bca.png');
    } else if (slug == 'BNI') {
      return Image.asset('assets/icons/payment/bni.png');
    } else if (slug == 'Mandiri') {
      return Image.asset('assets/icons/payment/mandiri.png');
    } else {
      return Image.asset('assets/icons/payment/qris.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth * 90 / 100,
      height: screenWidth * 23 / 100,
      decoration: BoxDecoration(
        color: Color(0xffEDEDED),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: 20,
                ),
                width: screenWidth * 19 / 100,
                height: screenHeight * 12 / 100,
                // height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _getBank(),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Row(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Change'),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: screenWidth * 5 / 100,
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
