import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class SaveJobScreen extends ConsumerStatefulWidget {
  const SaveJobScreen({Key? key}) : super(key: null);

  static const String path = 'SaveJobScreen';

  @override
  ConsumerState<SaveJobScreen> createState() => _SaveJobScreenState();
}

class _SaveJobScreenState extends ConsumerState<SaveJobScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("SaveJobScreen"),
      ),
    );
  }
}
