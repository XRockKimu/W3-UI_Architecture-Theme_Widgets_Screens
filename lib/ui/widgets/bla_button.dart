import 'package:flutter/material.dart';

class BlaButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isPrimary;
  final IconData? icon;
  final bool isFullWidth;

  const BlaButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isPrimary = true,
    this.icon,
    this.isFullWidth = true,
  });

  @override
  Widget build(BuildContext context) {
    final Widget child = icon != null
        ? Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon),
              const SizedBox(width: 8),
              Text(label),
            ],
          )
        : Text(label);

    final ButtonStyle style = isPrimary
        ? ElevatedButton.styleFrom()
        : OutlinedButton.styleFrom();

    final Widget button = isPrimary
        ? ElevatedButton(
            onPressed: onPressed,
            style: style,
            child: child,
          )
        : OutlinedButton(
            onPressed: onPressed,
            style: style,
            child: child,
          );

    if (isFullWidth) {
      return SizedBox(
        width: double.infinity,
        child: button,
      );
    }

    return button;
  }
}
