import 'package:flutter/material.dart';
import 'package:tictactoe/core/utils/app_toast.dart';
import 'package:tictactoe/core/utils/dimens.dart';
import 'package:tictactoe/core/utils/i18n.dart';
import 'package:tictactoe/ui/widgets/app_button.dart';

class SimplePlaceholder extends StatelessWidget {
  final String message;
  final String? tooltip;
  final VoidCallback? onRetry;
  final String? imageAsset;

  const SimplePlaceholder({
    required this.message,
    this.imageAsset,
    this.tooltip,
    this.onRetry,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (imageAsset != null) _getImage(),
        const SizedBox(height: space.half),
        _buildMessage(),
        const SizedBox(height: space.twice),
        if (onRetry != null) _buildButton(context),
      ],
    );
  }

  Widget _buildButton(BuildContext context) {
    return AppButton(
      onPressed: onRetry!,
      child: Text(
        I18n.of(context).tryAgain,
      ),
    );
  }

  Widget _getImage() {
    return Image.asset(
      imageAsset!,
      width: 100,
      fit: BoxFit.fitWidth,
    );
  }

  Widget _buildMessage() {
    return GestureDetector(
      onLongPress:
          tooltip?.isNotEmpty == true ? () => showAppToast(tooltip!) : null,
      child: Text(
        message,
        style: const TextStyle(
          fontSize: text.normal,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
