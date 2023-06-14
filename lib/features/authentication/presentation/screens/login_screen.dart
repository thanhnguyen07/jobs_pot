import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/common/app_colors.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String route = "LoginScreen";

  @override
  ConsumerState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: AppColors.babyBlueColor,
        child: const Column(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: [Text('ddg')],
              ),
            ),
            Expanded(
              flex: 1,
              child: Text('2'),
            ),
            Expanded(
              flex: 1,
              child: Text('3'),
            ),
          ],
        ),
      ),
    );
  }
}
