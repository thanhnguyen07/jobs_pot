import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    Key? key,
    required this.child,
    this.scroll = false,
    this.physicsScroll,
    this.paddingTop = false,
    this.unFocusKeyboard = false,
    this.fullView = true,
    this.appBar,
  }) : super(key: null);

  final Widget child;
  final bool scroll;
  final ScrollPhysics? physicsScroll;
  final bool paddingTop;
  final bool unFocusKeyboard;
  final bool fullView;
  final PreferredSizeWidget? appBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: GestureDetector(
        onTap: (unFocusKeyboard)
            ? () {
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              }
            : null,
        child: (scroll)
            ? Container(
                width: (fullView) ? null : double.infinity,
                height: (fullView) ? null : double.infinity,
                margin: EdgeInsets.only(
                  top: (paddingTop) ? MediaQuery.of(context).padding.top : 0,
                ),
                child: SingleChildScrollView(
                  physics: physicsScroll,
                  child: child,
                ),
              )
            : child,
      ),
    );
  }
}
