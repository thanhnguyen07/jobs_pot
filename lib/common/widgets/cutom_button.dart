import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.title,
    required this.backgroundColor,
    required this.onPressed,
    this.icon,
  }) : super(key: key);

  final Text title;
  final Color backgroundColor;
  final void Function() onPressed;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(5),
      ),
      child: Container(
        width: double.infinity,
        height: 50,
        color: backgroundColor,
        child: TextButton(
          onPressed: onPressed,
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon ?? const SizedBox(),
              title,
            ],
          ),
        ),
      ),
    );
  }
}
