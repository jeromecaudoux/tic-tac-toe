import 'package:flutter/material.dart';
import 'package:tictactoe/core/utils/dimens.dart';
import 'package:tictactoe/ui/theme/app_colors.dart';
import 'package:tictactoe/ui/theme/theme.dart';

typedef DropDownItemBuilder<T> = Widget Function(T value);

class AppDropDown<T> extends StatefulWidget {
  final String? hint;
  final T? value;
  final Iterable<T> items;
  final ValueChanged<T?> onChanged;
  final DropDownItemBuilder<T> itemBuilder;
  final bool enabled;
  final bool allowEmpty;

  const AppDropDown({
    this.hint,
    required this.value,
    required this.items,
    required this.itemBuilder,
    required this.onChanged,
    this.enabled = true,
    this.allowEmpty = false,
    super.key,
  });

  @override
  State<AppDropDown<T>> createState() => _AppDropDownState<T>();
}

class _AppDropDownState<T> extends State<AppDropDown<T>> {
  late T? _status = widget.value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: space.normal,
      ),
      decoration: BoxDecoration(
        color: AppColors.of(context).darker,
        borderRadius: BorderRadius.circular(space.normal),
      ),
      child: _buildStatusAndClearButton(),
    );
  }

  Widget _buildStatusAndClearButton() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 140,
          height: 38,
          child: _buildStatus(),
        ),
        if (widget.allowEmpty)
          Padding(
            padding: const EdgeInsets.only(left: space.half),
            child: IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                setState(() {
                  _status = null;
                  widget.onChanged(_status);
                });
              },
            ),
          ),
      ],
    );
  }

  Widget _buildStatus() {
    AppColors colors = AppColors.of(context);
    return DropdownButton<T>(
      value: _status,
      icon: Icon(
        Icons.keyboard_arrow_down,
        color: colors.violet,
      ),
      iconEnabledColor: Colors.white,
      iconSize: 24,
      elevation: 16,
      style: TextStyle(
        fontSize: text.h4,
        fontWeight: FontWeight.bold,
        fontFamily: AppTheme.fontFamily,
      ),
      selectedItemBuilder: (BuildContext context) {
        return widget.items.map<Widget>((T value) {
          return Align(
            alignment: Alignment.centerLeft,
            child: DefaultTextStyle(
              style: TextStyle(
                color: colors.textColor,
                fontSize: text.h4,
                fontWeight: FontWeight.bold,
                fontFamily: AppTheme.fontFamily,
              ),
              child: widget.itemBuilder(value),
            ),
          );
        }).toList();
      },
      dropdownColor: colors.darker,
      borderRadius: BorderRadius.circular(space.normal),
      isExpanded: true,
      underline: Container(height: 0, color: Colors.transparent),
      onChanged: widget.enabled
          ? (T? newValue) {
              setState(() {
                _status = newValue;
                widget.onChanged(_status);
              });
            }
          : null,
      hint: widget.hint == null
          ? null
          : Text(
              widget.hint!,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: text.small,
                fontWeight: FontWeight.w400,
              ),
            ),
      items: widget.items.map<DropdownMenuItem<T>>((T value) {
        return DropdownMenuItem<T>(
          value: value,
          child: DefaultTextStyle(
            style: TextStyle(
              color: colors.textColor,
              fontSize: text.h4,
              fontWeight: FontWeight.bold,
              fontFamily: AppTheme.fontFamily,
            ),
            child: widget.itemBuilder(value),
          ),
        );
      }).toList(),
    );
  }
}
