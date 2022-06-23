import '../model/summary_model.dart';
import '../util/api.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<CovidModel> fetchCovidList() {
    return _provider.fetchCovidList();
  }
}

class NetworkError extends Error {}
