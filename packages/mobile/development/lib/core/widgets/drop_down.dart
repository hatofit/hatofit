import 'package:flutter/material.dart';
import 'package:hatofit/core/core.dart';

class DropDown<T> extends StatefulWidget {
  final T value;
  final List<DropdownMenuItem<T>> items;
  final bool hintIsVisible;
  final String? hint;
  final ValueChanged<T?>? onChanged;
  final Widget? prefixIcon;

  const DropDown({
    super.key,
    required this.value,
    required this.items,
    this.hint,
    required this.onChanged,
    this.hintIsVisible = true,
    this.prefixIcon,
  });

  @override
  State<DropDown<T>> createState() => _DropDownState();
}

class _DropDownState<T> extends State<DropDown<T>> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimens.height8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.hintIsVisible) ...{
            Text(
              widget.hint ?? "",
            ),
            SpacerV(value: Dimens.height4),
          },
          ButtonTheme(
            key: widget.key,
            alignedDropdown: true,
            padding: EdgeInsets.zero,
            child: DropdownButtonFormField<T>(
              isExpanded: true,
              dropdownColor: Theme.of(context).extension<AppColors>()!.card,
              icon: const Icon(Icons.arrow_drop_down),
              decoration: InputDecoration(
                alignLabelWithHint: true,
                isDense: true,
                isCollapsed: true,
                filled: true,
                fillColor: Theme.of(context).extension<AppColors>()!.card,
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: Dimens.height8),
                  child: widget.prefixIcon,
                ),
                prefixIconConstraints: BoxConstraints(
                  minHeight: Dimens.height24,
                  maxHeight: Dimens.height24,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: Dimens.height8),
                enabledBorder: OutlineInputBorder(
                  gapPadding: 0,
                  borderRadius: BorderRadius.circular(Dimens.radius4),
                  borderSide: BorderSide(
                    color: Theme.of(context).extension<AppColors>()!.subtitle!,
                  ),
                ),
                border: OutlineInputBorder(
                  gapPadding: 0,
                  borderRadius: BorderRadius.circular(Dimens.radius4),
                  borderSide: BorderSide(color: Theme.of(context).cardColor),
                ),
                disabledBorder: OutlineInputBorder(
                  gapPadding: 0,
                  borderRadius: BorderRadius.circular(Dimens.radius4),
                  borderSide: BorderSide(color: Theme.of(context).cardColor),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  gapPadding: 0,
                  borderRadius: BorderRadius.circular(Dimens.radius4),
                  borderSide: BorderSide(
                    color: Theme.of(context).extension<AppColors>()!.red!,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  gapPadding: 0,
                  borderRadius: BorderRadius.circular(Dimens.radius4),
                  borderSide: BorderSide(
                    color: Theme.of(context).extension<AppColors>()!.red!,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  gapPadding: 0,
                  borderRadius: BorderRadius.circular(Dimens.radius4),
                  borderSide: BorderSide(
                    color: Theme.of(context).extension<AppColors>()!.blue!,
                  ),
                ),
              ),
              value: widget.value,
              items: widget.items,
              onChanged: widget.onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
