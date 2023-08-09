import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/features/create/presentation/widgets/create_header.dart';

class CreateJobScreen extends ConsumerStatefulWidget {
  const CreateJobScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<CreateJobScreen> createState() => _CreateJobScreenState();
}

class _CreateJobScreenState extends ConsumerState<CreateJobScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(20),
        child: CreateHeader(),
      ),
    );
  }
}
