import 'package:flutter/material.dart';

class UnFocusKeyboard extends StatelessWidget {
  const UnFocusKeyboard({Key? key, required this.context, required this.child})
      : super(key: key);

  final BuildContext context;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: child,
    );
  }
}
