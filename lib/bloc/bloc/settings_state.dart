part of 'settings_bloc.dart';

@immutable
abstract class SettingsState {
  final double? sliderFontSize;
  final bool? isBold;
  final bool? isItalic;

  SettingsState(
      {required this.sliderFontSize,
      required this.isBold,
      required this.isItalic});

  double get fontSize => sliderFontSize!;
}

class SettingsInitial extends SettingsState {
  SettingsInitial() : super(sliderFontSize: 10, isBold: false, isItalic: false);
}

class NewSettingState extends SettingsState {
  NewSettingState.fromOldSettingState(SettingsState oldState,
      {double? sliderFontSize, bool? isBold, bool? isItalic})
      : super(
          sliderFontSize: sliderFontSize ?? oldState.sliderFontSize,
          isBold: isBold ?? oldState.isBold,
          isItalic: isItalic ?? oldState.isItalic,
        );
}
