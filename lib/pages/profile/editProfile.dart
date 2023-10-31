import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:authentic_guards/pages/profile/apiWilayah/dropdownSearch.dart';
import 'package:authentic_guards/pages/profile/editProfile2.dart';

class editProfile extends StatelessWidget {
  editProfile({Key? key, required this.name}) : super(key: key);

  String name;

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final w = mediaQueryData.size.width;
    final h = mediaQueryData.size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            iconTheme: IconThemeData(size: w * 0.065, color: Colors.white),
            backgroundColor: Colors.transparent,
            // Properties for the AppBar
            expandedHeight: w * 0.25, // Set the desired height of the AppBar
            pinned: false, // Set this to false to make AppBar non-sticky
            flexibleSpace: Container(
              margin: EdgeInsets.only(top: w * 0.2, left: w * 0.12),

              // A container for the flexible space (background) of the AppBar
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Container(
                child: Text(
                  'EDIT PROFILE',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: w * 0.08,
                      fontWeight: FontWeight.w700),
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
                  top: w * 0.25,
                  left: w * 0.08,
                  right: w * 0.08,
                ),
                width: w,
                height: w * 3.5,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: w * 0.2,
                      child: Container(
                        width: w * 0.84,
                        height: w * 2.9,
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
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                child: _formProfile(
                                  title: 'Name',
                                  value: "Asep",
                                  // hint: 'Full Name',
                                  typeKeyboard: TextInputType.name,
                                ),
                              ),
                              Container(
                                child: JenisKelamin(),
                              ),
                              Container(
                                child: DateForm(),
                              ),
                              Container(
                                child: _formProfile(
                                  typeKeyboard: TextInputType.phone,
                                  title: 'Phone Number',
                                  value: '+62 000 0000 0000',
                                  // hint: 'Phone Number',
                                ),
                              ),
                              Container(
                                child: _formProfile(
                                  title: 'Email',
                                  value: 'asep@gmail.com',
                                  // hint: 'Email',
                                  typeKeyboard: TextInputType.emailAddress,
                                ),
                              ),
                              Container(
                                child: DropdownAddress(),
                              ),
                              Container(
                                child: _formProfile(
                                  title: 'Detail Address',
                                  value: 'Indramayu - Kertasemaya',
                                  // hint: 'Address',
                                  typeKeyboard: TextInputType.streetAddress,
                                ),
                              ),
                              Container(
                                child: _formProfile(
                                  title: 'Postal Code',
                                  value: '45274',
                                  // hint: 'Input your postal code',
                                  typeKeyboard: TextInputType.number,
                                ),
                              ),
                              // Container(
                              //   width: w * 0.4,
                              //   height: w * 0.1,
                              //   margin: EdgeInsets.only(top: w * 0.05),
                              //   child: ElevatedButton(
                              //     onPressed: () {},
                              //     child: Text('Save',
                              //         style: TextStyle(
                              //             fontSize: w * 0.04,
                              //             color: Colors.white)),
                              //     style: ButtonStyle(
                              //       backgroundColor: MaterialStateProperty.all(
                              //           Color(0xffff6161)),
                              //       shape: MaterialStateProperty.all(
                              //         RoundedRectangleBorder(
                              //             borderRadius:
                              //                 BorderRadius.circular(w * 0.05)),
                              //       ),
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: w * 0.23,
                      right: w * 0.04,
                      child: IconButton(
                        icon: Icon(Icons.edit_outlined),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => editProfile2(),
                            ),
                          ); // Add the co de to handle the edit profile action here
                        },
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

class DateForm extends StatefulWidget {
  const DateForm({super.key});

  @override
  State<DateForm> createState() => _DateFormState();
}

class _DateFormState extends State<DateForm> {
  TextEditingController _dateController = TextEditingController();
  @override
  void initState() {
    super.initState();

    // Mengatur tanggal awal (misalnya 1 Januari 2000)
    _dateController.text = '2003-04-03';
  }

  String _birthDate = '';
  String _ageResult = '';

  _selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.black, // warna header
            colorScheme: ColorScheme.light(primary: Colors.black),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (selectedDate != null) {
      setState(() {
        _dateController.text = DateFormat('dd-MM-yyyy').format(selectedDate);
        _birthDate = _dateController.text;
        int age = DateTime.now().year - selectedDate.year;
        if (selectedDate.month > DateTime.now().month ||
            (selectedDate.month == DateTime.now().month &&
                selectedDate.day > DateTime.now().day)) {
          age--;
        }
        _ageResult = '$age Year';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    TextEditingController _controller = TextEditingController();

    void _showValue() {
      final inputValue = _controller.text;
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('Value of TextField: $inputValue'),
          );
        },
      );
    }

    return Container(
      padding: EdgeInsets.all(w * 0.02),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Date of birth',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: w * 0.04,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          Container(
            child: TextField(
              readOnly: true,
              controller: _dateController,
              cursorColor: Colors.black,
              mouseCursor: SystemMouseCursors.click,
              style: TextStyle(
                fontSize: w * 0.04,
              ),
              decoration: InputDecoration(
                suffixIcon: Icon(
                  Icons.date_range,
                  color: Colors.grey,
                  size: w * 0.05,
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.grey), // Warna saat TextField difokuskan
                ),
              ),
              onTap: () {
                // Mencegah popup keyboard
                FocusScope.of(context).requestFocus(FocusNode());
                // Menampilkan date picker
                _selectDate(context);
              },
            ),
          ),
          SizedBox(
            height: w * 0.05,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Age',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: w * 0.04,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          Container(
            child: TextFormField(
              enabled: false,
              controller:
                  _controller, // Menghubungkan TextEditingController ke TextField

              decoration: InputDecoration(
                labelText: _ageResult,
                labelStyle: TextStyle(color: Colors.black),
                disabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black54),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class JenisKelamin extends StatefulWidget {
  @override
  _ButtonColorChangerState createState() => _ButtonColorChangerState();
}

class _ButtonColorChangerState extends State<JenisKelamin> {
  bool button1Clicked = false;
  bool button2Clicked = false;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(w * 0.02),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Jenis Kelamin',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: w * 0.04,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: w * 0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      button1Clicked = true;
                      button2Clicked = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: button1Clicked ? Colors.blue : Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(w * 0.02),
                    ),
                  ),
                  child: Text(
                    'Male',
                    style: TextStyle(color: Colors.white, fontSize: w * 0.04),
                  ),
                ),
                SizedBox(width: w * 0.03),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      button1Clicked = false;
                      button2Clicked = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: button2Clicked ? Colors.pink : Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(w * 0.02),
                    ),
                  ),
                  child: Text(
                    'Female',
                    style: TextStyle(color: Colors.white, fontSize: w * 0.04),
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

class _formProfile extends StatelessWidget {
  final String title;
  final String value;
  // final String hint;
  final TextInputType typeKeyboard;
  const _formProfile({
    required this.title,
    required this.value,
    // required this.hint,
    required this.typeKeyboard,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.all(w * 0.02),
      child: Column(
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
            keyboardType: typeKeyboard,
            style: TextStyle(fontSize: w * 0.04),
            initialValue: value,
            // decoration: InputDecoration(
            //     hintText: hint,
            //     hintStyle: TextStyle(
            //       fontSize: w * 0.04,
            //     )),
          )
        ],
      ),
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
