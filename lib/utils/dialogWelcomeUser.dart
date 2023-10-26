import 'package:flutter/material.dart';

void _showWelcomeDialog(BuildContext context, String userName) {
  showDialog(
    context: context,
    barrierDismissible: true, // User harus menekan tombol untuk menutup dialog
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Selamat Datang!'),
        content: Text('Halo, $userName! Terima kasih telah masuk.'),
      );
    },
  );
}
