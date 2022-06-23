class SettingState {
  late double fontSize;
  late bool isBold;
  late bool isItalic;
  late String color;

  SettingState({
    required this.fontSize,
    required this.isBold,
    required this.isItalic,
    required this.color,
  });

  SettingState copyWith({fontSize, isBold, isItalic, color}) {
    return SettingState(
        fontSize: fontSize ?? this.fontSize,
        isBold: isBold ?? this.isBold,
        isItalic: isItalic ?? this.isItalic,
        color: color ?? this.color);
  }
}
