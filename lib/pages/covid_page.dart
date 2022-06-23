import 'package:bloc_flutter/cubit_state/setting_cubit.dart';
import 'package:bloc_flutter/cubit_state/setting_state.dart';
import 'package:bloc_flutter/fragments/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/covid_boc/bloc/covid_bloc.dart';
import '../model/summary_model.dart';
import '../navidation_drawer.dart';

class CovidPage extends StatefulWidget {
  const CovidPage({Key? key}) : super(key: key);

  static const String routeName = '/covidPage';

  @override
  State<CovidPage> createState() => _CovidPageState();
}

class _CovidPageState extends State<CovidPage> {
  final CovidBloc _newsBloc = CovidBloc();
  @override
  void initState() {
    _newsBloc.add(GetCovidList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(title: const Text('COVID-19 List')),
      body: _buildListCovid(),
    );
  }

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

  Widget _buildListCovid() {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _newsBloc,
        child: BlocListener<CovidBloc, CovidState>(
          listener: (context, state) {
            if (state is CovidError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage),
                ),
              );
            }
          },
          child: BlocBuilder<CovidBloc, CovidState>(
            builder: (context, state) {
              if (state is CovidInitial) {
                return _buildLoading();
              } else if (state is CovidLoadingState) {
                return _buildLoading();
              } else if (state is CovidLoadedState) {
                return _buildCard(context, state.covidModel);
              } else if (state is CovidError) {
                return Container();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, CovidModel model) {
    return ListView.builder(
      itemCount: model.countries!.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(8.0),
          child: Card(
            child: Container(
              margin: EdgeInsets.all(8.0),
              child: BlocBuilder<SettingCubit, SettingState>(
                builder: (context, state) {
                  return Column(
                    children: <Widget>[
                      Text(
                        "Country: ${model.countries![index].country}",
                        style: TextStyle(
                          fontSize: state.fontSize.toDouble(),
                          fontWeight: state.isBold
                              ? FontWeight.bold
                              : FontWeight.normal,
                          fontStyle: state.isItalic
                              ? FontStyle.italic
                              : FontStyle.normal,
                          color: colors(state.color),
                        ),
                      ),
                      Text(
                        "Total Confirmed: ${model.countries![index].totalConfirmed}",
                        style: TextStyle(
                          fontSize: state.fontSize.toDouble(),
                          fontWeight: state.isBold
                              ? FontWeight.bold
                              : FontWeight.normal,
                          fontStyle: state.isItalic
                              ? FontStyle.italic
                              : FontStyle.normal,
                          color: colors(state.color),
                        ),
                      ),
                      Text(
                        "Total Deaths: ${model.countries![index].totalDeaths}",
                        style: TextStyle(
                          fontSize: state.fontSize.toDouble(),
                          fontWeight: state.isBold
                              ? FontWeight.bold
                              : FontWeight.normal,
                          fontStyle: state.isItalic
                              ? FontStyle.italic
                              : FontStyle.normal,
                          color: colors(state.color),
                        ),
                      ),
                      Text(
                        "Total Recovered: ${model.countries![index].totalRecovered}",
                        style: TextStyle(
                          fontSize: state.fontSize.toDouble(),
                          fontWeight: state.isBold
                              ? FontWeight.bold
                              : FontWeight.normal,
                          fontStyle: state.isItalic
                              ? FontStyle.italic
                              : FontStyle.normal,
                          color: colors(state.color),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildLoading() => Center(child: CircularProgressIndicator());
}
