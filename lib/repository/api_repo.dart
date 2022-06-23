import 'package:bloc_flutter/model/news_model.dart';

import '../model/summary_model.dart';
import '../util/api.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<CovidModel> fetchCovidList() {
    return _provider.fetchCovidList();
  }

  Future<NewsModel> fetchNewsList() {
    return _provider.fetchNews();
  }
}

class NetworkError extends Error {}
