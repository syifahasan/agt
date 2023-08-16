import 'package:authentic_guards/pages/notification.dart';
import 'package:flutter/material.dart';

class editProfile extends StatelessWidget {
  const editProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final w = mediaQueryData.size.width;
    final h = mediaQueryData.size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            iconTheme: IconThemeData(size: w * 0.05, color: Colors.white),
            backgroundColor: Colors.transparent,
            // Properties for the AppBar
            expandedHeight: w * 0.35, // Set the desired height of the AppBar
            pinned: false, // Set this to false to make AppBar non-sticky
            flexibleSpace: Container(
              margin: EdgeInsets.only(top: w * 0.15, left: w * 0.1),
              height: w * 0.5,
              // A container for the flexible space (background) of the AppBar
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Container(
                padding: EdgeInsets.only(),
                child: Text(
                  'EDIT PROFILE',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: w * 0.08,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          // SliverList to contain the scrollable content
          SliverToBoxAdapter(
            child: ClipPath(
              clipper: MyClipPath(),
              child: Container(
                padding: EdgeInsets.only(
                  top: w * 0.3,
                  left: w * 0.08,
                  right: w * 0.08,
                ),
                width: w,
                height: w * 2.3,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: w * 0.2,
                      child: Container(
                        width: w * 0.84,
                        height: w * 1.45,
                        decoration: BoxDecoration(
                          gradient: RadialGradient(
                            colors: [
                              Colors.white,
                              Color.fromARGB(255, 58, 57, 57)
                            ],
                            radius: w * 0.015,
                          ),
                          borderRadius:
                              BorderRadius.all(Radius.circular(w * 0.1)),
                        ),
                        child: Container(
                          padding: EdgeInsets.only(
                              top: w * 0.18, left: w * 0.05, right: w * 0.05),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(w * 0.02),
                                child: _formProfile(
                                  title: 'Name',
                                  value: 'Asep Saefuddin Zuhri',
                                  hint: 'Full Name',
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(w * 0.02),
                                child: _formProfile(
                                  title: 'Phone Number',
                                  value: '+62 000 0000 0000',
                                  hint: 'Phone Number',
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(w * 0.02),
                                child: _formProfile(
                                  title: 'Email',
                                  value: 'asep@gamil.com',
                                  hint: 'Email',
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(w * 0.02),
                                child: _formProfile(
                                  title: 'Address',
                                  value: 'Indramayu - Kertasemaya',
                                  hint: 'Address',
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(w * 0.02),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Column(
                                        children: [
                                          Container(
                                            child: _dropdownCity(),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Column(
                                        children: [
                                          Container(
                                            child: _dropdownCode(),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(w * 0.02),
                                child: _formProfile(
                                  title: 'Country',
                                  value: 'Indonesia',
                                  hint: 'Country',
                                ),
                              ),
                              Container(
                                width: w * 0.4,
                                height: w * 0.055,
                                margin: EdgeInsets.only(top: w * 0.05),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text('Save',
                                      style: TextStyle(
                                          fontSize: w * 0.04,
                                          color: Colors.white)),
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Color(0xffff6161)),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(w * 0.05)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        width: w * 0.35,
                        height: w * 0.35,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    'assets/other/profile1.png',
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: CircleAvatar(
                                radius: w * 0.05,
                                backgroundColor:
                                    Theme.of(context).scaffoldBackgroundColor,
                                child: Container(
                                  margin: EdgeInsets.all(w * 0.015),
                                  decoration: const BoxDecoration(
                                      color: Colors.green,
                                      shape: BoxShape.circle),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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

class _formProfile extends StatelessWidget {
  final String title;
  final String value;
  final String hint;
  const _formProfile({
    required this.title,
    required this.value,
    required this.hint,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: w * 0.04,
            ),
          ),
        ),
        TextFormField(
          initialValue: value,
          decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                fontSize: w * 0.04,
              )),
        )
      ],
    );
  }
}

class MyClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path = Path();
    path.moveTo(0, h); // Starting point (bottom-left corner)
    path.lineTo(0, 80); // Left side
    path.quadraticBezierTo(
        w * 0.5, 0, w, 80); // Top with quadratic Bezier curve
    path.lineTo(w, h); // Right side
    path.close(); // Complete the shape
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class _dropdownCity extends StatefulWidget {
  const _dropdownCity({super.key});

  @override
  State<_dropdownCity> createState() => __dropdownState();
}

class __dropdownState extends State<_dropdownCity> {
  String? _selectedCity;
  final List<String> _city = [
    'Indramayu',
    'Bandung',
    'Cirebon',
    'Jakarta',
    'Solo',
    'Bali',
    'Bogor',
  ];
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Container(
      width: w * 0.35,
      child: Column(
        children: [
          Container(
            alignment: Alignment.bottomLeft,
            child: Text(
              'City',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: w * 0.04,
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            width: w * 15,
            child: DropdownButton(
              value: _selectedCity,
              hint: Text(
                'Select Your City',
                style: TextStyle(fontSize: w * 0.045),
              ),
              underline: Container(
                height: w * 0.001,
                color: Colors.black,
              ),
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.black,
                size: w * 0.05,
              ),
              items: _city
                  .map((city) =>
                      DropdownMenuItem<String>(value: city, child: Text(city)))
                  .toList(),
              onChanged: (String? newValue) {
                setState(
                  () {
                    _selectedCity = newValue;
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _dropdownCode extends StatefulWidget {
  const _dropdownCode({super.key});

  @override
  State<_dropdownCode> createState() => __dropdownCodeState();
}

class __dropdownCodeState extends State<_dropdownCode> {
  String? _selectedCode;
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    final List<String> _code = [
      '00000',
      '00001',
      '00002',
      '00003',
      '00004',
      '00005',
      '000006',
    ];
    return Container(
      width: w * 0.3,
      child: Column(
        children: [
          Container(
            alignment: Alignment.bottomLeft,
            child: Text(
              'Zip Code',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: w * 0.04,
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: DropdownButton(
              value: _selectedCode,
              hint: Text(
                'Select',
                style: TextStyle(fontSize: w * 0.045),
              ),
              underline: Container(
                height: w * 0.001,
                color: Colors.black,
              ),
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.black,
                size: w * 0.05,
              ),
              items: _code
                  .map((code) =>
                      DropdownMenuItem<String>(value: code, child: Text(code)))
                  .toList(),
              onChanged: (String? newValue) {
                setState(
                  () {
                    _selectedCode = newValue;
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
