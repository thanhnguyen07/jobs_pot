import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class BottomTabBar extends ConsumerStatefulWidget {
  const BottomTabBar({Key? key}) : super(key: key);

  static const String path = '/BottomTabBar';

  @override
  ConsumerState<BottomTabBar> createState() => _BottomTabBarState();
}

class _BottomTabBarState extends ConsumerState<BottomTabBar> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("BottomTabBar"),
      ),
    );
  }
}
