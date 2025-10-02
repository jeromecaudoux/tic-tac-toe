import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:tictactoe/core/utils/dimens.dart' as dimens;

void showAppToast(String message) {
  if (message.isEmpty) {
    return;
  }
  showToastWidget(
    SafeArea(
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.only(
            left: dimens.space.normal,
            right: dimens.space.normal,
          ),
          child: MzToast(
            child: Builder(
              builder: (context) {
                return Text(message, textAlign: TextAlign.center);
              },
            ),
          ),
        ),
      ),
    ),
    position: const ToastPosition(
      align: Alignment.bottomCenter,
      offset: -dimens.space.normal,
    ),
    duration: const Duration(milliseconds: 4300),
  );
}

class MzToast extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;

  const MzToast({required this.child, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(25)),
          ),
          child: GestureDetector(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.only(
                right: dimens.space.andQuarter,
                top: dimens.space.quarter,
                bottom: dimens.space.quarter,
                left: dimens.space.quarter,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // const Image(
                  //   image: AssetImage('assets/ic_serenity.png'),
                  //   width: 28,
                  //   fit: BoxFit.fitWidth,
                  // ),
                  Icon(Icons.warning, weight: 28),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth:
                          constraints.maxWidth -
                          28 -
                          dimens.space.andQuarter -
                          dimens.space.quarter,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: dimens.space.half),
                      child: child,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
