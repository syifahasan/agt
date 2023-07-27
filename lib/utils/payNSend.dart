import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PaySlidingMenu extends StatelessWidget {
  final PanelController panelController;
  PaySlidingMenu({Key? key, required this.panelController});

  @override
  Widget build(BuildContext context) {
    final panelHeightOpen = MediaQuery.of(context).size.height * 0.7;
    return SlidingUpPanel(
      controller: panelController,
      maxHeight: panelHeightOpen,
      backdropEnabled: true,
      defaultPanelState: PanelState.CLOSED,
      minHeight: 0,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      backdropTapClosesPanel: true,
      panel: Text("Tes"),
      //panel: ,
    );
  }
}
