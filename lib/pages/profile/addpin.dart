import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:authentic_guards/pages/profile/appBar.dart';
import 'package:authentic_guards/pages/profile/change_pass.dart';
import 'package:authentic_guards/pages/profile/change_pin.dart';
import 'package:authentic_guards/pages/profile/privacy.dart';

class AddPin extends StatefulWidget {
  const AddPin({super.key});

  @override
  State<AddPin> createState() => _AddPinState();
}

class _AddPinState extends State<AddPin> {
  String pin = '';
  String enteredPin = '';
  bool isPinVisible = false;

  void clearPin() {
    setState(() {
      pin = '';
    });
  }

  void _pin() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return changePin();
        },
      ),
    );
  }

  void _submitPin() {
    if (pin.length == 6) {
      // Gantilah logika ini dengan validasi PIN sesuai dengan aturan yang Anda inginkan.
      // Contoh: PIN harus hanya terdiri dari angka
      if (int.tryParse(pin) != null) {
        // Jika PIN sesuai dengan aturan validasi, navigasi ke halaman selanjutnya
      } else {
        print('PIN tidak valid. Coba lagi.');
        clearPin();
      }
    } else {
      print('Masukkan PIN lengkap');
    }
  }

  Widget numButton(int number) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: TextButton(
        onPressed: () {
          setState(() {
            if (enteredPin.length < 6) {
              enteredPin += number.toString();
            }
          });
        },
        child: Text(
          number.toString(),
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(height: 40),
            const Center(
              child: Text(
                'Enter Your pin',
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                6,
                (index) {
                  return Container(
                    margin: const EdgeInsets.all(6.0),
                    width: isPinVisible ? 50 : 16,
                    height: isPinVisible ? 50 : 16,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      color: index < enteredPin.length
                          ? isPinVisible
                              ? Colors.green
                              : CupertinoColors.activeBlue
                          : CupertinoColors.activeBlue.withOpacity(0.1),
                    ),
                    child: isPinVisible && index < enteredPin.length
                        ? Center(
                            child: Text(
                              enteredPin[index],
                              style: const TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                          )
                        : null,
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            IconButton(
              onPressed: () {
                setState(() {
                  isPinVisible = !isPinVisible;
                });
              },
              icon: Icon(
                isPinVisible ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            SizedBox(height: 40),
            SizedBox(height: isPinVisible ? 50.0 : 8.00),
            for (var i = 0; i < 3; i++)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    3,
                    (index) => numButton(1 + 3 * i + index),
                  ).toList(),
                ),
              ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(onPressed: null, child: SizedBox()),
                  numButton(0),
                  TextButton(
                    onPressed: () {
                      setState(
                        () {
                          if (enteredPin.isNotEmpty) {
                            enteredPin =
                                enteredPin.substring(0, enteredPin.length - 1);
                          }
                        },
                      );
                    },
                    child: const Icon(Icons.backspace,
                        color: Colors.black, size: 24),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {
                _submitPin();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PagePrivacy()));
              },
              child: const Text(
                'Submit',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                _pin();
              },
              child: const Text(
                'Forget Password ?',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
