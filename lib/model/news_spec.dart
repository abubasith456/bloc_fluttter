import 'package:flutter/foundation.dart';

class NewsSpec {
  String country = 'in';
  String category = 'general';

  NewsSpec(this.country, this.category);

  NewsSpec copyWith({country, category}) {
    return NewsSpec(
      country ?? this.country,
      category ?? this.category,
    );
  }
}
