import 'package:flutter/material.dart';
import 'package:tictactoe/core/utils/dimens.dart';
import 'package:tictactoe/ui/theme/app_colors.dart';

abstract class AppTheme {
  static const String fontFamily = 'Switzer';

  static ThemeData _mainTheme(BuildContext context, AppColors colors) {
    final ThemeData theme = ThemeData(fontFamily: fontFamily);
    return theme.copyWith(
      extensions: [colors],
      brightness: colors.brightness,
      highlightColor: colors.violet.withValues(alpha: 0.1),
      splashColor: colors.darker.withValues(alpha: 0.8),
      scaffoldBackgroundColor: colors.dark,
      appBarTheme: AppBarTheme(
        backgroundColor: colors.darker,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: space.normal * 1.2,
          fontWeight: FontWeight.bold,
          color: colors.textColor,
        ),
        iconTheme: IconThemeData(color: colors.textColor),
      ),
      primaryTextTheme: theme.primaryTextTheme.copyWith(
        titleLarge: TextStyle(
          fontSize: space.normal * 1.2,
          fontWeight: FontWeight.bold,
          color: colors.textColor,
        ),
      ),
      dropdownMenuTheme: DropdownMenuThemeData(
        textStyle: TextStyle(
          color: colors.textColor,
          fontSize: space.normal,
        ),
        menuStyle: MenuStyle(
          backgroundColor: WidgetStateProperty.all(colors.darker),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colors.darker,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: space.normal,
        ),
        labelStyle: TextStyle(
          color: colors.textColor,
          fontSize: space.normal,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: space.normal,
          vertical: space.half,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(space.half),
          borderSide: BorderSide.none,
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          iconColor: WidgetStateProperty.all(colors.textColor),
          overlayColor: WidgetStateProperty.all(
            colors.violet.withValues(alpha: 0.1),
          ),
        ),
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
          fontSize: space.normal * 1.2,
          fontWeight: FontWeight.bold,
          color: colors.textColor,
        ),
        bodyLarge: TextStyle(
          fontSize: 18,
          height: 1.3,
          decoration: TextDecoration.none,
          color: colors.textColor,
        ),
        bodyMedium: TextStyle(
          fontSize: 16,
          height: 1.15,
          decoration: TextDecoration.none,
          color: colors.textColor,
        ),
      ),
      colorScheme: ColorScheme.dark(
        primary: colors.violet,
        surface: colors.darker,
        onSurface: colors.grey,
      ),
      listTileTheme: ListTileThemeData(
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: colors.textColor,
        ),
        subtitleTextStyle: TextStyle(
          fontWeight: FontWeight.w200,
          color: colors.grey,
        ),
        iconColor: colors.textColor,
        horizontalTitleGap: space.half,
        contentPadding: EdgeInsets.symmetric(
          horizontal: space.normal,
          vertical: 0,
        ),
      ),
      datePickerTheme: DatePickerThemeData(
        backgroundColor: colors.dark,
        rangePickerBackgroundColor: colors.dark,
        rangeSelectionBackgroundColor: colors.violet,
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(
            color: colors.textColor,
            fontSize: space.normal,
          ),
          hintStyle: TextStyle(color: Colors.grey, fontSize: space.normal),
        ),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: colors.dark,
        titleTextStyle: TextStyle(
          fontSize: 24,
          color: colors.textColor,
        ),
      ),
      switchTheme: SwitchThemeData(
        trackOutlineColor: WidgetStateProperty.all(colors.violet),
        thumbColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return colors.textColor.withValues(alpha: 0.5);
          }
          return colors.textColor;
        }),
        trackColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return colors.violet;
          }
          return colors.dark;
        }),
      ),
      iconTheme: IconThemeData(color: colors.textColor),
    );
  }

  static ThemeData light(BuildContext context) =>
      _mainTheme(context, AppColors.light());

  static ThemeData dark(BuildContext context) =>
      _mainTheme(context, AppColors.dark());
}

extension ThemeModeExt on ThemeMode {
  ThemeData theme(BuildContext context) {
    switch (this) {
      case ThemeMode.system:
        final brightness = MediaQuery.platformBrightnessOf(context);
        if (brightness == Brightness.dark) {
          return AppTheme.dark(context);
        } else {
          return AppTheme.light(context);
        }
      case ThemeMode.light:
        return AppTheme.light(context);
      case ThemeMode.dark:
        return AppTheme.dark(context);
    }
  }
}
