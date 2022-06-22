import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../const/const.dart';
import '../cubit_state/setting_cubit.dart';
import '../cubit_state/setting_state.dart';
import '../navidation_drawer.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/homePage';

  get http => null;

  Color colors(String name) {
    if (name == 'Red') {
      return Colors.red;
    } else if (name == 'Blue') {
      return Colors.blue;
    } else if (name == 'Green') {
      return Colors.green;
    } else if (name == 'Yellow') {
      return Colors.yellow;
    } else if (name == 'Orange') {
      return Colors.orange;
    }
    return Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        drawer: NavigationDrawer(),
        body:
            BlocBuilder<SettingCubit, SettingState>(builder: ((context, state) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                // Container(
                //   width: MediaQuery.of(context).size.width,
                //   child: StoreConnector<AppState, VoidCallback>(
                //     converter: (store) {
                //       return store.dispatch(getUser());
                //     },
                //     builder: (context, callback) {
                //       return TextButton(
                //           onPressed: callback,
                //           child: Text('Press to fetch'));
                //     },
                //   ),
                // ),
                TextButton(
                    onPressed: () {
                      // final response = await http.get(Uri.parse(
                      //     'https://jsonplaceholder.typicode.com/users'));
                      // print(response.statusCode);
                      // final value = jsonDecode(response.body);
                      // getUser();
                      // StoreProvider.of<AppState>(context).dispatch(getUser());
                    },
                    child: Text('Press to fetch')),
                Container(
                  child: Text(
                    Strings.paragraph,
                    style: TextStyle(
                      fontSize: state.fontSize.toDouble(),
                      fontWeight:
                          state.isBold ? FontWeight.bold : FontWeight.normal,
                      fontStyle:
                          state.isItalic ? FontStyle.italic : FontStyle.normal,
                      // color: colors(state.color),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // Container(
                //   height: MediaQuery.of(context).size.height - 230,
                //   width: MediaQuery.of(context).size.width,
                //   child: ListView.builder(
                //     scrollDirection: Axis.vertical,
                //     itemCount: state.users?.length,
                //     itemBuilder: (context, index) => Card(
                //       elevation: 6,
                //       margin: EdgeInsets.all(10),
                //       child: ListTile(
                //         title: Text(state.users![index].name!),
                //         subtitle: Text(state.users![index].email!),
                //       ),
                //     ),
                //   ),
                // )
              ],
            ),
          );
        })));
  }
}
