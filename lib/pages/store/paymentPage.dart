import 'package:authentic_guards/utils/payment/topUpMethod.dart';
import 'package:flutter/material.dart';
import 'package:authentic_guards/pages/store/paymentMethod.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final screenWidth = mediaQueryData.size.width;
    final screenHeight = mediaQueryData.size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.transparent,
            // Properties for the AppBar
            expandedHeight:
                screenHeight * 20 / 100, // Set the desired height of the AppBar
            pinned: false, // Set this to false to make AppBar non-sticky
            flexibleSpace: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 70, left: 30),
                    height: screenHeight * 20 / 100,
                    // A container for the flexible space (background) of the AppBar
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'SHIPPING',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth * 0.075,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'AND PAYMENT',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth * 0.075,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // SliverList to contain the scrollable content
          SliverToBoxAdapter(
            child: ClipPath(
              clipper: MyClipPath(),
              child: Container(
                padding: EdgeInsets.only(
                  top: 90,
                ),
                width: screenWidth,
                height: screenHeight,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Container(
                  child: Column(
                    children: [
                      CustomDropdown(),
                      Container(
                        padding: EdgeInsets.only(
                            top: screenWidth * 0.1,
                            left: screenWidth * 0.05,
                            right: screenWidth * 0.05),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(screenWidth * 0.02),
                              child: _formProfile(
                                title: 'Name',
                                value: '',
                                hint: 'Full Name',
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(screenWidth * 0.02),
                              child: _formProfile(
                                title: 'Email',
                                value: '',
                                hint: 'Email',
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(screenWidth * 0.02),
                              child: _formProfile(
                                title: 'Address',
                                value: '',
                                hint: 'Address',
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(screenWidth * 0.02),
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
                              padding: EdgeInsets.all(screenWidth * 0.02),
                              child: _formProfile(
                                title: 'Country',
                                value: '',
                                hint: 'Country',
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
          ),
        ],
      ),
      floatingActionButton: Container(
        height: screenWidth * 45 / 100,
        width: screenWidth,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Divider(
              indent: 20,
              endIndent: 20,
              thickness: 1.5,
            ),
            Container(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.08, right: screenWidth * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text('Total'),
                  ),
                  Container(
                    child: Text(
                      'Rp 524.223,68',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
            FloatingActionButton.extended(
              backgroundColor: Color(0xffFF6161),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentMethod(),
                  ),
                );
              },
              label: Container(
                width: screenWidth * 70 / 100,
                child: Center(
                  child: Text(
                    'Continue Payment',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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

//dropdown fiks
class CustomDropdown extends StatefulWidget {
  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? selectedValue;
  List<String> dropdownItems = [
    'J&T Express',
    'JNE Express',
    'Sicepat',
    'Ninja Express'
  ];
  bool isDropdownOpen = false;

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final screenWidth = mediaQueryData.size.width;
    final screenHeight = mediaQueryData.size.height;

    return Container(
      width: screenWidth * 0.85,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isDropdownOpen = !isDropdownOpen;
              });
            },
            child: Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(selectedValue ?? 'Shipping Method'),
                  Icon(isDropdownOpen
                      ? Icons.arrow_drop_up
                      : Icons.arrow_drop_down),
                ],
              ),
            ),
          ),
          if (isDropdownOpen)
            Container(
              padding: EdgeInsets.only(top: 4, left: 10, right: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: dropdownItems.map((String value) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedValue = value;
                        isDropdownOpen = false;
                      });
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(value),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
        ],
      ),
    );
  }
}

// class ShippingDropdown extends StatefulWidget {
//   @override
//   _ShippingDropdownState createState() => _ShippingDropdownState();
// }

// class _ShippingDropdownState extends State<ShippingDropdown> {
//   String? selectedShippingCompany;
//   List<String> shippingCompanies = [
//     'J&T Express',
//     'JNE Express',
//     'Sicepat',
//     'Ninja Express',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton<String>(

//       value: selectedShippingCompany,
//       dropdownColor: Colors.grey,
//       items: shippingCompanies.map((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(value),
//         );
//       }).toList(),
//       onChanged: (String? newValue) {
//         setState(() {
//           selectedShippingCompany = newValue;
//         });
//       },
//     );
//   }
// }

// class DropdownExample extends StatefulWidget {
//   @override
//   _DropdownExampleState createState() => _DropdownExampleState();
// }

// class _DropdownExampleState extends State<DropdownExample> {
//   String? selectedValue =
//       'Shipping Payment'; // Nilai yang dipilih dalam dropdown
//   List<String> dropdownItems = [
//     'JnT Express',
//     'Sicepat',
//     'JNE Express',
//     'Ninja Express'
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton<String>(
//       value: selectedValue,
//       items: dropdownItems.map((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(value),
//         );
//       }).toList(),
//       onChanged: (String? newValue) {
//         setState(() {
//           selectedValue = newValue;
//         });
//       },
//     );
//   }
// }

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
