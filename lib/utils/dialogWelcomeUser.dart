import 'package:flutter/material.dart';

class DialogUtils {
  static void showWelcomeDialog(BuildContext context, [String? userName]) {
    showDialog(
      context: context,
      barrierDismissible:
          true, // User harus menekan tombol untuk menutup dialog
      builder: (BuildContext context) {
        return Center(
          child: AlertDialog(
            title: Text(
              'Welcome!',
              style:
                  TextStyle(fontSize: MediaQuery.of(context).size.width * 0.1),
            ),
            content: Text(userName != null
                ? 'Halo, $userName! Terima kasih telah masuk.'
                : 'Terima kasih telah masuk.'),
          ),
        );
      },
    );
  }
}
