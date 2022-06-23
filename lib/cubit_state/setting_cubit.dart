// import 'package:cubit/cubit.dart';
import 'package:bloc_flutter/cubit_state/setting_state.dart';
import 'package:bloc_flutter/model/news_spec.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit()
      : super(SettingState(
            fontSize: 15,
            isBold: false,
            isItalic: false,
            color: 'Black',
            newsCountry: 'in'));

  void fontSize(double size) => emit(state.copyWith(fontSize: size));
  void isBold(bool value) => emit(state.copyWith(isBold: value));
  void isItalic(bool value) => emit(state.copyWith(isItalic: value));
  void color(String value) => emit(state.copyWith(color: value));
  // void newsSpec(NewsSpec value) => emit(state.copyWith(newSpec: value));
  void newsCountry(String value) => emit(state.copyWith(newsCountry: value));
}
