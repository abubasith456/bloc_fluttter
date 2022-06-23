part of 'covid_bloc.dart';

abstract class CovidState extends Equatable {
  const CovidState();

  @override
  List<Object> get props => [];
}

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
