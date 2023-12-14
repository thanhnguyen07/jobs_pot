import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/features/home/application/jobs_summary_controller.dart';
import 'package:jobs_pot/features/home/application/recent_list_controller.dart';
import 'package:jobs_pot/features/home/domain/entities/JobsSummary/jobs_summary_entity.dart';
import 'package:jobs_pot/features/home/domain/entities/RecentList/recent_list_entity.dart';
import 'package:jobs_pot/features/home/infrastructure/home_respository.dart';

final homeRespositoryProvider = Provider<HomeRespinsitory>(
  (ref) => HomeRespinsitory(),
);

final jobsSummaryController =
    StateNotifierProvider<JobsSummaryController, JobsSummaryEntity?>(
  (ref) => JobsSummaryController(ref),
);

final recentListController =
    StateNotifierProvider<RecentListController, List<RecentListEntity>?>(
  (ref) => RecentListController(ref),
);
