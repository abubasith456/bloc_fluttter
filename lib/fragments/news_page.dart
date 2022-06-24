import 'package:bloc_flutter/cubit_state/setting_cubit.dart';
import 'package:bloc_flutter/cubit_state/setting_state.dart';
import 'package:bloc_flutter/fragments/settings.dart';
import 'package:bloc_flutter/model/news_model.dart';
import 'package:bloc_flutter/pages/news_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/covid_boc/bloc/covid_bloc.dart';
import '../model/summary_model.dart';
import '../navidation_drawer.dart';

class NewsPage extends StatefulWidget {
  BuildContext context;
  NewsPage(this.context);

  static const String routeName = '/newsPage';

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late final CovidBloc _newsBloc = CovidBloc(context);

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
  void initState() {
    _newsBloc.add(GetNewsList());
    super.initState();
  }

  @override
  void dispose() {
    _newsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(title: const Text('News List')),
      body: _buildListCovid(),
    );
  }

  Widget _buildListCovid() {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _newsBloc,
        child: BlocListener<CovidBloc, CovidState>(
          listener: (context, state) {
            if (state is NewsError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                ),
              );
            } else if (state is NewsCountryChanged) {
              BlocBuilder<SettingCubit, SettingState>(
                builder: (context, state) {
                  return context.read();
                },
              );
            }
          },
          child: BlocBuilder<CovidBloc, CovidState>(
            builder: (context, state) {
              if (state is NewsInitial) {
                return _buildLoading();
              } else if (state is NewsLoadingState) {
                return _buildLoading();
              } else if (state is NewsLoadedState) {
                return _buildCard(context, state.newsModel);
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

  Widget _buildCard(BuildContext context, NewsModel model) {
    return ListView.builder(
      itemCount: model.articles!.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            navigateToArticleDetails(context, model.articles![index]);
          },
          child: Container(
            margin: const EdgeInsets.all(2),
            child: Card(
              child: Container(
                margin: const EdgeInsets.all(10),
                child: BlocBuilder<SettingCubit, SettingState>(
                  builder: (context, state) {
                    return Row(
                      children: [
                        TitleAndDescription(context, model, index),
                        ImageAndIcon(context, model, index),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget TitleAndDescription(BuildContext context, NewsModel model, int index) {
    return Flexible(
      child: BlocBuilder<SettingCubit, SettingState>(
        builder: (context, state) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10, right: 8),
                child: Text(
                  model.articles![index].title ?? "No title",
                  style: TextStyle(
                    fontSize: state.fontSize.toDouble(),
                    fontWeight: FontWeight.bold,
                    fontStyle:
                        state.isItalic ? FontStyle.italic : FontStyle.normal,
                    color: colors(state.color),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Text(
                      model.articles![index].description ?? "No description",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: state.fontSize.toDouble(),
                        fontWeight:
                            state.isBold ? FontWeight.bold : FontWeight.normal,
                        fontStyle: state.isItalic
                            ? FontStyle.italic
                            : FontStyle.normal,
                        color: colors(state.color),
                      ),
                      maxLines: 3)),
            ],
          );
        },
      ),
    );
  }

  Widget ImageAndIcon(BuildContext context, NewsModel model, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 3,
          height: MediaQuery.of(context).size.width / 3,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(model.articles![index].urlToImage ??
                      ImageURLS.DEFAULT_IMG_URL)),
              borderRadius: BorderRadiusDirectional.circular(8)),
        ),
        const SizedBox(
          height: 10,
        ),
        const Icon(
          Icons.more_horiz,
          color: Color.fromARGB(191, 163, 163, 163),
        )
      ],
    );
  }

  void navigateToArticleDetails(BuildContext context, Articles articles) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => (NewsDetailsPage(articles))));
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());
}

class ImageURLS {
  static const DEFAULT_IMG_URL =
      "https://thumbs.dreamstime.com/z/not-available-stamp-seal-watermark-distress-style-designed-rectangle-circles-stars-black-vector-rubber-print-title-138796185.jpg";
}
