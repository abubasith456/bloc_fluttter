import 'package:bloc_flutter/const/const_string.dart';
import 'package:dio/dio.dart';

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
}
