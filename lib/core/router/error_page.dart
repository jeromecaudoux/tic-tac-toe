import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tictactoe/core/router/router.dart';
import 'package:tictactoe/core/utils/dimens.dart';
import 'package:tictactoe/core/utils/i18n.dart';

class ErrorScreen extends StatelessWidget {
  final bool showButton;
  final String? title;
  final String? message;
  final String? buttonLabel;
  final Exception? error;
  final String? fullPath;
  final VoidCallback? onButtonPressed;

  const ErrorScreen({
    this.error,
    this.fullPath,
    this.title,
    this.message,
    this.buttonLabel,
    this.onButtonPressed,
    this.showButton = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: _buildBody(context)));
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: space.normal),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          const Icon(Icons.error_outline, size: 120),
          const SizedBox(height: space.normal),
          Text(
            title ?? I18n.of(context).placeholderTitle,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: text.h3,
            ),
          ),
          const SizedBox(height: space.quarter),
          Text(
            message ?? I18n.of(context).youGotLostNothingHere,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: text.h4,
            ),
          ),
          if (fullPath?.isNotEmpty == true)
            Text(
              fullPath ?? '',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: text.h4,
                color: Colors.white,
              ),
            ),
          const SizedBox(height: space.twice),
          _buildButton(context),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return ElevatedButton(
      onPressed: onButtonPressed ?? () => context.go(Routes.home.path),
      child: Text(
        buttonLabel ??
            (message == null
                ? I18n.of(context).goHomepage
                : I18n.of(context).back),
      ),
    );
  }
}
