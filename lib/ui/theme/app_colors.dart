import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  // static const Color dark = Color(0xFF2C3039);
  // static const Color darker = Color(0xFF262A34);
  // static const Color violet = Color(0xFF7DD1C2);
  // static const Color yellow = Color(0xFFECAF37);
  // static const Color blue = Color(0xFF378DB4);
  // static const Color red = Color(0xFFD2C2C5);
  // static const Color redAccent = Color(0xFFDA5263);
  // static const Color orange = Color(0xFFF47000);
  // static const Color green = Color(0xFF91A9D8);
  // static const Color successGreen = Color(0xFF7AB664);
  // static const Color grey = Color(0xFFD2C2C5);
  // static const Color separator = Color(0xFF305065);

  final Color textColor;
  final Color dark;
  final Color darker;
  final Color violet;
  final Color yellow;
  final Color blue;
  final Color red;
  final Color redAccent;
  final Color orange;
  final Color green;
  final Color successGreen;
  final Color grey;
  final Color separator;
  final Brightness brightness;

  static AppColors of(BuildContext context) {
    return Theme.of(context).extension<AppColors>()!;
  }

  const AppColors.light({
    this.textColor = const Color(0xFF262A34),
    this.dark = const Color(0xFFF2F2F2),
    this.darker = const Color(0xFFE5E5E5),
    this.violet = const Color(0xFF59CDB9),
    this.yellow = const Color(0xFFECAF37),
    this.blue = const Color(0xFF378DB4),
    this.red = const Color(0xFFD2C2C5),
    this.redAccent = const Color(0xFFDA5263),
    this.orange = const Color(0xFFF47000),
    this.green = const Color(0xFF91A9D8),
    this.successGreen = const Color(0xFF7AB664),
    this.grey = const Color(0xFF4F4F4F),
    this.separator = const Color(0xFFD1D1D1),
    this.brightness = Brightness.light,
  });

  const AppColors.dark({
    this.textColor = const Color(0xFFFFFFFF),
    this.dark = const Color(0xFF2C3039),
    this.darker = const Color(0xFF262A34),
    this.violet = const Color(0xFF7DD1C2),
    this.yellow = const Color(0xFFECAF37),
    this.blue = const Color(0xFF378DB4),
    this.red = const Color(0xFFD2C2C5),
    this.redAccent = const Color(0xFFDA5263),
    this.orange = const Color(0xFFF47000),
    this.green = const Color(0xFF91A9D8),
    this.successGreen = const Color(0xFF7AB664),
    this.grey = const Color(0xFFD2C2C5),
    this.separator = const Color(0xFF305065),
    this.brightness = Brightness.dark,
  });

  @override
  ThemeExtension<AppColors> copyWith({
    Color? dark,
    Color? darker,
    Color? violet,
    Color? yellow,
    Color? blue,
    Color? red,
    Color? redAccent,
    Color? orange,
    Color? green,
    Color? successGreen,
    Color? grey,
    Color? separator,
    Brightness? brightness,
  }) {
    return (this.brightness == Brightness.dark
        ? AppColors.dark
        : AppColors.light)(
      dark: dark ?? this.dark,
      darker: darker ?? this.darker,
      violet: violet ?? this.violet,
      yellow: yellow ?? this.yellow,
      blue: blue ?? this.blue,
      red: red ?? this.red,
      redAccent: redAccent ?? this.redAccent,
      orange: orange ?? this.orange,
      green: green ?? this.green,
      successGreen: successGreen ?? this.successGreen,
      grey: grey ?? this.grey,
      separator: separator ?? this.separator,
      brightness: brightness ?? this.brightness,
    );
  }

  @override
  ThemeExtension<AppColors> lerp(
    covariant ThemeExtension<AppColors>? other,
    double t,
  ) {
    if (other is! AppColors) {
      return this;
    }
    return (brightness == Brightness.dark ? AppColors.dark : AppColors.light)(
      dark: Color.lerp(dark, other.dark, t)!,
      darker: Color.lerp(darker, other.darker, t)!,
      violet: Color.lerp(violet, other.violet, t)!,
      yellow: Color.lerp(yellow, other.yellow, t)!,
      blue: Color.lerp(blue, other.blue, t)!,
      red: Color.lerp(red, other.red, t)!,
      redAccent: Color.lerp(redAccent, other.redAccent, t)!,
      orange: Color.lerp(orange, other.orange, t)!,
      green: Color.lerp(green, other.green, t)!,
      successGreen: Color.lerp(successGreen, other.successGreen, t)!,
      grey: Color.lerp(grey, other.grey, t)!,
      separator: Color.lerp(separator, other.separator, t)!,
      brightness: t < 0.5 ? brightness : other.brightness,
    );
  }
}
