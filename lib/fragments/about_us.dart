import "package:flutter/material.dart";

import '../navidation_drawer.dart';

class AboutUs extends StatelessWidget {
  static const String routeName = '/contactPage';

  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About us"),
      ),
      drawer: NavigationDrawer(),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            'Hi,This is example prgram for redux state management ',
            // style: TextStyle(
            //   fontWeight:
            //       state.isBold ? FontWeight.bold : FontWeight.normal,
            //   fontSize: state.fontSize.toDouble(),
            //   fontStyle:
            //       state.isItalic ? FontStyle.italic : FontStyle.normal,
            // ),
          )),
    );
  }
}
