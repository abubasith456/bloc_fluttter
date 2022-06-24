import 'package:bloc_flutter/const/const_string.dart';
import 'package:bloc_flutter/cubit_state/setting_cubit.dart';
import 'package:bloc_flutter/model/news_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/summary_model.dart';

class ApiProvider {
  final Dio _dio = Dio();

  Future<CovidModel> fetchCovidList() async {
    try {
      Response response = await _dio.get(Strings.BASE_URL);
      return CovidModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return CovidModel.withError("Data not found / Connection issue");
    }
  }

  Future<NewsModel> fetchNews(BuildContext context) async {
    try {
      //Get from the Cubi state
      String countryCode = context.read<SettingCubit>().state.newsCountry;

      //Get from Cubi state (category)

      String categoryCode = context.read<SettingCubit>().state.categotyCode;
      //Replace the countrycode
      String apiUrl = (Strings.newsApi)
          .replaceAll("{countryCode}", countryCode)
          .replaceAll("{categoryCode}", categoryCode);

      Response response = await _dio.get(apiUrl);
      return NewsModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return NewsModel.fromError("Data not found / Connection issue");
    }
  }
}
