import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String id;
  final void Function() onPressed;
  final Color bgColor;
  final Color fgColor;
  final String text;

  const AppButton({
    super.key,
    required this.id,
    required this.onPressed,
    required this.bgColor,
    required this.fgColor,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        width: 100,
        height: 35,
        padding: const EdgeInsets.only(bottom: 2.0),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20.0,
              color: fgColor,
            ),
          ),
        ),
      ),
    );
  }
}
