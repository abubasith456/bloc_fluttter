import 'package:bloc_flutter/bloc/counter_block.dart';
import 'package:bloc_flutter/cubit_state/setting_cubit.dart';
import 'package:bloc_flutter/cubit_state/setting_state.dart';
import 'package:bloc_flutter/fragments/about_us.dart';
import 'package:bloc_flutter/fragments/news_page.dart';
import 'package:bloc_flutter/pages/covid_page.dart';
import 'package:bloc_flutter/routes/pageRoutes.dart';
import 'package:bloc_flutter/widget/cubit_counter_wiget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_cubit/flutter_cubit.dart';

import 'fragments/home.dart';
import 'fragments/settings.dart';

//--no-sound-null-safety
// @dart=2.9
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => SettingCubit(),
        lazy: false,
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            routes: {
              // PageRoutes.covidPage: (context) => CovidPage(),
              PageRoutes.newsPage: (context) => NewsPage(),
              PageRoutes.home: (context) => HomePage(),
              PageRoutes.aboutUs: (context) => AboutUs(),
              PageRoutes.settings: (context) => SettingPage()
            },
            home: const NewsPage()));
  }
}

//Default Counter page
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  final streamController = CounterBlock();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder(
              initialData: 0,
              stream: streamController.counterStream,
              builder: (context, value) {
                return Text(
                  '${value.data}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              streamController.eventSink.add(CounterAction.increment);
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            width: 5,
          ),
          FloatingActionButton(
            onPressed: () {
              streamController.eventSink.add(CounterAction.decrememt);
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          const SizedBox(
            width: 5,
          ),
          FloatingActionButton(
            onPressed: () {
              streamController.eventSink.add(CounterAction.reset);
            },
            tooltip: 'Reset',
            child: const Icon(
              Icons.replay_outlined,
            ),
          )
        ],
      ),
    );
  }
}
