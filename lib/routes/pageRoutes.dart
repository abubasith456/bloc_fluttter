import 'package:bloc_flutter/fragments/qr_scanner_page.dart';
import 'package:bloc_flutter/pages/covid_page.dart';

import '../fragments/news_page.dart';
import '../fragments/settings.dart';
import '../fragments/about_us.dart';
import '../fragments/home.dart';

class PageRoutes {
  static const String covidPage = CovidPage.routeName;
  static const String newsPage = NewsPage.routeName;
  static const String qrScannerPage = QRscannerPage.routeName;
  static const String home = HomePage.routeName;
  static const String aboutUs = AboutUs.routeName;
  static const String settings = SettingPage.routeName;
}
