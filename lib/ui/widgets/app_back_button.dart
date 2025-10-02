import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tictactoe/core/utils/dimens.dart';
import 'package:tictactoe/ui/theme/app_colors.dart';
import 'package:tictactoe/ui/widgets/pointer_scale_effect.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PointerScaleEffect(
      scale: 0.05,
      child: GestureDetector(
        onTap: context.pop,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: AppColors.of(context).violet, width: 2),
            borderRadius: BorderRadius.circular(space.half),
          ),
          padding: const EdgeInsets.all(space.quarterAndSmall),
          child: Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.of(context).violet,
            size: 15,
          ),
        ),
      ),
    );
  }
}
