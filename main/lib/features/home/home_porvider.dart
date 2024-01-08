import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/features/home/application/jobs_summary_controller.dart';
import 'package:jobs_pot/features/home/application/recent_list_controller.dart';
import 'package:jobs_pot/features/home/infrastructure/home_respository.dart';
import 'package:models/entities/jobs_summary/jobs_summary_entity.dart';
import 'package:models/entities/recent_list/recent_list_entity.dart';

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
