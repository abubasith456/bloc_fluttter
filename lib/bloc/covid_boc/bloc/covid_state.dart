part of 'covid_bloc.dart';

abstract class CovidState extends Equatable {
  const CovidState();

  @override
  List<Object> get props => [];
}

//Covid state
class CovidInitial extends CovidState {}

class CovidLoadingState extends CovidState {}

class CovidLoadedState extends CovidState {
  final CovidModel covidModel;
  const CovidLoadedState(this.covidModel);
}

class CovidError extends CovidState {
  final String errorMessage;
  const CovidError(this.errorMessage);
}

//News State
class NewsInitial extends CovidState {}

class NewsLoadingState extends CovidState {}

class NewsLoadedState extends CovidState {
  final NewsModel newsModel;
  const NewsLoadedState(this.newsModel);
}

class NewsCountryChanged extends CovidState {}

class NewsError extends CovidState {
  final String error;
  const NewsError(this.error);
}
