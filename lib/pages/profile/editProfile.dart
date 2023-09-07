import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:authentic_guards/pages/profile/apiWilayah/dropdownSearch.dart';

class editProfile extends StatelessWidget {
  const editProfile({super.key});

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
                        height: w * 2.8,
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
                                child: _formProfile(
                                  title: 'Name',
                                  value: 'Asep Saefuddin Zuhri',
                                  hint: 'Full Name',
                                ),
                              ),
                              Container(
                                child: DateForm(),
                              ),
                              Container(
                                child: _formProfile(
                                  title: 'Phone Number',
                                  value: '+62 000 0000 0000',
                                  hint: 'Phone Number',
                                ),
                              ),
                              Container(
                                child: _formProfile(
                                  title: 'Email',
                                  value: 'asep@gamil.com',
                                  hint: 'Email',
                                ),
                              ),
                              Container(
                                child: DropdownAddress(),
                              ),
                              Container(
                                child: _formProfile(
                                  title: 'Detail Address',
                                  value: 'Indramayu - Kertasemaya',
                                  hint: 'Address',
                                ),
                              ),
                              Container(
                                child: _formProfile(
                                  title: 'Postal Code',
                                  value: '45274',
                                  hint: 'Input your postal code',
                                ),
                              ),
                              Container(
                                width: w * 0.4,
                                height: w * 0.1,
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
        _ageResult = '$age tahun';
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
            content: Text('Nilai dari TextField: $inputValue'),
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
              'Tanggal Lahir',
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
              'Umur',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: w * 0.04,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          Container(
            child: TextFormField(
              controller:
                  _controller, // Menghubungkan TextEditingController ke TextField
              decoration: InputDecoration(
                  labelText: _ageResult,
                  labelStyle: TextStyle(color: Colors.black)),
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
            style: TextStyle(fontSize: w * 0.04),
            initialValue: value,
            decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(
                  fontSize: w * 0.04,
                )),
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
      padding: EdgeInsets.all(w * 0.02),
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
