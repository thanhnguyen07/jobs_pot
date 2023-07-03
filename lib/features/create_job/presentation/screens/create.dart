import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class CreateJobScreen extends ConsumerStatefulWidget {
  const CreateJobScreen({Key? key}) : super(key: key);

  static const String path = '/CreateJobScreen';

  @override
  ConsumerState<CreateJobScreen> createState() => _CreateJobScreenState();
}

class _CreateJobScreenState extends ConsumerState<CreateJobScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("CreateJobScreen"),
      ),
    );
  }
}
