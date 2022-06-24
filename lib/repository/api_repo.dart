import 'package:bloc_flutter/model/news_model.dart';
import 'package:flutter/material.dart';

import '../model/summary_model.dart';
import '../util/api.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<CovidModel> fetchCovidList() {
    return _provider.fetchCovidList();
  }

  Future<NewsModel> fetchNewsList(BuildContext context) {
    return _provider.fetchNews(context);
  }
}

class NetworkError extends Error {}
