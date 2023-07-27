import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ScannerPage extends StatefulWidget {
  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  PanelController _pc = PanelController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SlidingUpPanelExample"),
      ),
      body: SlidingUpPanel(
        controller: _pc,
        panel: Center(
          child: Text("This is the sliding Widget"),
        ),
        body: _body(),
      ),
    );
  }

  Widget _body() {
    return Container(
      child: Column(
        children: <Widget>[
          ElevatedButton(
              child: Text("Open"),
              onPressed: () {
                _pc.open();
              }),
          ElevatedButton(
            child: Text("Close"),
            onPressed: () => _pc.close(),
          ),
          ElevatedButton(
            child: Text("Show"),
            onPressed: () => _pc.show(),
          ),
          ElevatedButton(
            child: Text("Hide"),
            onPressed: () => _pc.hide(),
          ),
        ],
      ),
    );
  }
}
