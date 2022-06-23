import 'package:bloc_flutter/cubit_state/setting_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:flutter_cubit/flutter_cubit.dart';

import '../bloc/bloc/settings_bloc.dart';
import '../cubit_state/setting_state.dart';
import '../navidation_drawer.dart';

class SettingPage extends StatelessWidget {
  static const String routeName = '/eventPage';

  // var store = Store<DropDownState>(dropDownReducer,
  //     initialState: DropDownState(color: 'Black'));
  var selectedValue = 'Black';
  var items = [
    'Blue',
    'Green',
    'Red',
    'Yellow',
    'Orange',
    'Black',
  ];

  @override
  Widget build(BuildContext context) {
    // final SettingsBloc settingsBloc = BlocProvider.of<SettingsBloc>(context);

    int _value = 10;
    double _currentSliderValue = 20;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      drawer: NavigationDrawer(),
      body: BlocBuilder<SettingCubit, SettingState>(
        builder: (_, state) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                'Font Size',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Slider(
                value: state.fontSize.toDouble(),
                min: 10,
                max: 30,
                label: _currentSliderValue.toString(),
                onChanged: (double value) {
                  _currentSliderValue = value;
                  // BlocProvider.value(
                  //   value: BlocProvider.of(context),
                  //   child: ,

                  // create: (context) => state,
                  // c

                  // );
                  // MultiBlocProvider(key: key
                  // ,).of<SettingsBloc>(context).add(FontSize(value));
                  // StoreProvider.of<AppState>(context)
                  //     .dispatch(FontSize(value.toInt()));
                  context.read<SettingCubit>().fontSize(value);
                },
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Font Style:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                child: Row(
                  children: [
                    Checkbox(
                      value: state.isBold,
                      onChanged: (newValue) {
                        // StoreProvider.of<AppState>(context)
                        //     .dispatch(Bold(newValue!));
                        // BlocProvider.of<SettingsBloc>(context)
                        //     .add(Bold(newValue!));
                        context.read<SettingCubit>().isBold(newValue!);
                      },
                    ),
                    const Text(
                      "Bold",
                      // style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                child: Row(
                  children: [
                    Checkbox(
                      value: state.isItalic,
                      onChanged: (newValue) {
                        // StoreProvider.of<AppState>(context)
                        //     .dispatch(Italic(newValue!));
                        // BlocProvider.of<SettingsBloc>(context)
                        //     .add(Italic(newValue!));
                        context.read<SettingCubit>().isItalic(newValue!);
                      },
                    ),
                    const Text(
                      "Italic",
                      // style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Text color:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                child: DropdownButton<String>(
                  items: items.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    // StoreProvider.of<AppState>(context).dispatch(Color(value!));
                    context.read<SettingCubit>().color(value!);
                  },
                  value: state.color,
                ),
              ),
              // StoreProvider<DropDownState>(
              //   store: store,
              //   child: Container(
              //     alignment: Alignment.center,
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         const SizedBox(
              //           width: 10,
              //         ),
              //         DropdownButton<String>(
              //           items: items.map((String value) {
              //             return DropdownMenuItem<String>(
              //               value: value,
              //               child: SizedBox(
              //                   width: MediaQuery.of(context).size.width -
              //                       80,
              //                   child: Text(value)),
              //             );
              //           }).toList(),
              //           onChanged: (value) {
              //             StoreProvider.of<AppState>(context)
              //                 .dispatch(Color(value!));
              //           },
              //           value: state.color,
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ]),
          );
        },
      ),
    );
  }
}
