import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class PostJobScreen extends ConsumerStatefulWidget {
  const PostJobScreen({Key? key}) : super(key: key);

  static const String path = '/PostJobScreen';

  @override
  ConsumerState<PostJobScreen> createState() => _PostJobScreenState();
}

class _PostJobScreenState extends ConsumerState<PostJobScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("PostJobScreen"),
      ),
    );
  }
}
