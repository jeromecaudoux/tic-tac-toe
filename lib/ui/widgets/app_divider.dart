import 'package:flutter/material.dart';
import 'package:tictactoe/core/utils/dimens.dart';
import 'package:tictactoe/ui/theme/app_colors.dart';

class AppDivider extends StatelessWidget {
  final Color? color;
  final EdgeInsets margin;
  final String? title;

  const AppDivider({
    this.title,
    this.color,
    this.margin = const EdgeInsets.symmetric(
      horizontal: space.normal,
      vertical: space.normal,
    ),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Widget line = _line(context);
    if (title?.isNotEmpty == true) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: space.half),
        child: Row(
          children: [
            Expanded(child: line),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: space.half),
              child: Text(
                title!,
                style: TextStyle(
                  fontSize: text.h3,
                  fontWeight: FontWeight.bold,
                  color: AppColors.of(context).violet,
                ),
              ),
            ),
            Expanded(child: line),
          ],
        ),
      );
    }
    return line;
  }

  Container _line(BuildContext context) {
    return Container(
      height: 1,
      margin: margin,
      width: double.infinity,
      color: color ?? AppColors.of(context).violet,
    );
  }
}
