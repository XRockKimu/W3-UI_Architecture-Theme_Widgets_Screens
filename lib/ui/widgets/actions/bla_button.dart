import 'package:flutter/material.dart';
import '../../theme/theme.dart';

enum ButtonType { primary, secondary }

class BlaButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final ButtonType type;
  final IconData? icon;

  const BlaButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.type = ButtonType.primary,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final bool isPrimary = type == ButtonType.primary;

    final Color backgroundColor =
        isPrimary ? BlaColors.primary : BlaColors.white;

    final BorderSide border = isPrimary
        ? BorderSide.none
        : BorderSide(color: BlaColors.greyLight, width: 2);

    final Color contentColor =
        isPrimary ? BlaColors.white : BlaColors.primary;

    List<Widget> children = [];

    if (icon != null) {
      children.add(
        Icon(
          icon,
          size: 20,
          color: contentColor,
        ),
      );
      children.add(
        SizedBox(width: BlaSpacings.s),
      );
    }

    children.add(
      Text(
        text,
        style: BlaTextStyles.button.copyWith(color: contentColor),
      ),
    );

    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: EdgeInsets.symmetric(
            vertical: BlaSpacings.m,
          ),
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(BlaSpacings.radius),
          ),
          side: border,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: children,
        ),
      ),
    );
  }
}
