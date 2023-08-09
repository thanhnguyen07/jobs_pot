import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/features/home/application/jobs_summary_controller.dart';
import 'package:jobs_pot/features/home/domain/entities/jobs_summary_entity.dart';
import 'package:jobs_pot/features/home/infrastructure/home_respository.dart';

final homeRespositoryProvider = Provider<HomeRespinsitory>(
  (ref) => HomeRespinsitory(),
);

final jobsSummaryController =
    StateNotifierProvider<JobsSummaryController, JobsSummaryEntity?>(
  (ref) => JobsSummaryController(ref),
);
