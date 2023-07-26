import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PaySlidingMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PanelController _panelController = PanelController();
    final panelHeightOpen = MediaQuery.of(context).size.height * 0.7;
    return Scaffold(
      body: SlidingUpPanel(
        controller: _panelController,
        maxHeight: panelHeightOpen,
        defaultPanelState: PanelState.CLOSED,
        minHeight: 0,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        backdropTapClosesPanel: true,
        panel: Text("Tes"),
        //panel: ,
      ),
    );
  }
}