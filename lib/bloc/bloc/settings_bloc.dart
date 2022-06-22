// ignore_for_file: void_checks

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsInitial()) {
    on<SettingsEvent>((event, emit) async* {
      if (event is FontSize) {
        yield NewSettingState.fromOldSettingState(state,
            sliderFontSize: event.payload);
      } else if (event is Bold) {
        yield NewSettingState.fromOldSettingState(state, isBold: event.payload);
      } else if (event is Italic) {
        yield NewSettingState.fromOldSettingState(state,
            isItalic: event.payload);
      }
    });
  }
}
