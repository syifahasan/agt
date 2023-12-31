import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SlidingUpPanelExample(),
    );
  }
}

class SlidingUpPanelExample extends StatefulWidget {
  @override
  _SlidingUpPanelExampleState createState() => _SlidingUpPanelExampleState();
}

class _SlidingUpPanelExampleState extends State<SlidingUpPanelExample> {
  bool _isFirstPanelVisible = true;

  void _togglePanels() {
    setState(() {
      _isFirstPanelVisible = !_isFirstPanelVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sliding Up Panel Navigation')),
      body: Stack(
        children: [
          SlidingUpPanel(
            backdropEnabled: true,
            panel: Center(
              child: ElevatedButton(
                onPressed: _togglePanels,
                child: Text('Navigate to Second Panel'),
              ),
            ),
          ),
          SlidingUpPanel(
            backdropEnabled: true,
            controller: PanelController(),
            panel: Center(
              child: ElevatedButton(
                onPressed: _togglePanels,
                child: Text('Navigate to First Panel'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
