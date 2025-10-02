import 'package:flutter/material.dart';
import 'package:tictactoe/ui/theme/app_colors.dart';
import 'package:tictactoe/ui/widgets/app_divider.dart';
import 'package:tictactoe/core/utils/dimens.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader(this.title, {super.key});


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: space.normal),
          child: Text(
            title,
            style: TextStyle(
              fontSize: text.h4,
              fontWeight: FontWeight.bold,
              color: AppColors.of(context).violet
            ),
          ),
        ),
        const AppDivider(),
      ],
    );
  }
}
