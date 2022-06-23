import 'package:bloc_flutter/const/const_string.dart';
import 'package:bloc_flutter/cubit_state/setting_cubit.dart';
import 'package:bloc_flutter/cubit_state/setting_state.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';

import '../navidation_drawer.dart';

class AboutUs extends StatelessWidget {
  static const String routeName = '/contactPage';

  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingCubit, SettingState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("About us"),
          ),
          drawer: NavigationDrawer(),
          body: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                Strings.aboutUs,
                style: TextStyle(
                  fontWeight:
                      state.isBold ? FontWeight.bold : FontWeight.normal,
                  fontSize: state.fontSize.toDouble(),
                  fontStyle:
                      state.isItalic ? FontStyle.italic : FontStyle.normal,
                ),
              )),
        );
      },
    );
  }
}
