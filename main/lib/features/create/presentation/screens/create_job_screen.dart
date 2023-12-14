import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/common/constant/app_colors.dart';
import 'package:jobs_pot/common/constant/app_text_styles.dart';
import 'package:jobs_pot/features/create/presentation/widgets/create_header.dart';

class CreateJobScreen extends ConsumerStatefulWidget {
  const CreateJobScreen({Key? key}) : super(key: null);

  @override
  ConsumerState<CreateJobScreen> createState() => _CreateJobScreenState();
}

class _CreateJobScreenState extends ConsumerState<CreateJobScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(20),
        child: CreateHeader(),
      ),
      body: Center(
        child: Container(
          height: 100,
          color: AppColors.amberColor,
          child: Column(
            textDirection: TextDirection.ltr,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                color: AppColors.babyBlueColor,
                width: double.infinity,
                child: const Text(
                  "1",
                  style: AppTextStyle.blackBoldS40,
                ),
              ),
              const Text("Dola Dola"),
            ],
          ),
        ),
      ),
    );
  }
}
