import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe/core/utils/dimens.dart';
import 'package:tictactoe/ui/theme/app_colors.dart';
import 'package:tictactoe/ui/widgets/app_back_button.dart';

class CustomAppBar extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  final String title;
  final Widget? trailing;

  const CustomAppBar({required this.title, this.trailing, super.key});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  ConsumerState<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends ConsumerState<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).viewPadding.top + space.half,
        left: space.half,
        right: space.half,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.of(context).darker,
          borderRadius: BorderRadius.circular(space.half),
        ),
        padding: const EdgeInsets.symmetric(horizontal: space.halfAndQuarter),
        width: double.infinity,
        height: kToolbarHeight,
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    final bool useCloseButton =
        parentRoute is PageRoute<dynamic> && parentRoute.fullscreenDialog;
    Widget? leading;
    if (parentRoute?.impliesAppBarDismissal ?? false) {
      leading = useCloseButton ? const CloseButton() : const AppBackButton();
    }
    return Row(
      children: [
        if (leading != null) ...[leading, const SizedBox(width: space.half)],
        Expanded(child: _buildTitle()),
        if (widget.trailing != null) widget.trailing!,
      ],
    );
  }

  Widget _buildTitle() {
    return Text(
      widget.title,
      style: const TextStyle(
        fontSize: text.normal,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
