import 'package:flutter/material.dart';
import 'package:tictactoe/core/utils/dimens.dart';
import 'package:tictactoe/core/utils/i18n.dart';
import 'package:tictactoe/ui/theme/app_colors.dart';

FormFieldValidator<String> passwordValidator(BuildContext context) => (value) {
  if (value == null || value.isEmpty) {
    return I18n.of(context).passwordRequired;
  }
  if (value.length < 6) {
    return I18n.of(context).invalidPasswordLength;
  }
  return null;
};

FormFieldValidator<String> notEmptyValidator(BuildContext context) => (value) {
  if (value == null || value.isEmpty) {
    return I18n.of(context).requiredTextField;
  }
  return null;
};

class AppTextField extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onSubmitted;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final bool autofocus;
  final int? maxLength;
  final int? maxLines;
  final String label;

  const AppTextField({
    required this.label,
    this.controller,
    this.autofocus = false,
    this.textInputAction,
    this.keyboardType,
    this.onSubmitted,
    this.validator,
    this.obscureText,
    this.maxLength,
    this.maxLines = 1,
    super.key,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool _hidePassword = widget.obscureText == true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      maxLength: widget.maxLength,
      maxLines: widget.maxLines,
      autofocus: widget.autofocus,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        suffixIcon: _buildSuffix(),
        labelText: widget.label.toUpperCase(),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: TextStyle(
          color: AppColors.of(context).grey,
          fontWeight: FontWeight.bold,
          fontSize: text.normal,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.of(context).blue,
            width: 2,
          ),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.of(context).grey,
            width: 1,
          ),
        ),
      ),
      style: TextStyle(
        fontSize: text.h4,
        fontWeight: FontWeight.bold,
      ),
      obscureText: _hidePassword,
      validator: widget.validator ?? notEmptyValidator(context),
      textInputAction: widget.textInputAction,
      onFieldSubmitted: widget.onSubmitted,
    );
  }

  Widget? _buildSuffix() {
    if (widget.obscureText == true) {
      return IconButton(
        icon: Icon(
          _hidePassword ? Icons.visibility : Icons.visibility_off,
          color: AppColors.of(context).grey,
        ),
        onPressed: () {
          setState(() {
            _hidePassword = !_hidePassword;
          });
        },
      );
    }
    return null;
  }
}
