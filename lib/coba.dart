import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SlidingUpPanelExample extends StatefulWidget {
  @override
  _SlidingUpPanelExampleState createState() => _SlidingUpPanelExampleState();
}

class _SlidingUpPanelExampleState extends State<SlidingUpPanelExample> {
  bool _isFirstPanelVisible = true;
  final PanelController _firstPanelController = PanelController();
  final PanelController _secondPanelController = PanelController();

  void _togglePanels() {
    if (_isFirstPanelVisible) {
      _firstPanelController.close();
      _secondPanelController.open();
    } else {
      _firstPanelController.open();
      _secondPanelController.close();
    }
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
            controller: _firstPanelController,
            backdropEnabled: true,
            panel: Center(
              child: ElevatedButton(
                onPressed: _togglePanels,
                child: Text('Navigate to Second Panel'),
              ),
            ),
          ),
          SlidingUpPanel(
            controller: _secondPanelController,
            backdropEnabled: true,
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

