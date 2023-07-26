import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({super.key});

  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  final PanelController _panelController = PanelController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        controller: _panelController,
        maxHeight: 400.0, // Set the maximum height of the sliding panel
        panel: Center(
          child: Text('Sliding Up Panel Content'),
        ),
        collapsed: Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
          ),
          child: Center(
            child: Text('Tap here to show panel', style: TextStyle(color: Colors.white)),
          ),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              _panelController.isPanelOpen ? _panelController.close() : _panelController.open();
            },
            child: Text('Toggle Panel'),
          ),
        ),
      ),
    );
  }
}