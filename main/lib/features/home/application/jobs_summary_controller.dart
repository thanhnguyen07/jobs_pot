import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/features/home/domain/entities/jobs_summary_entity.dart';
import 'package:jobs_pot/features/home/home_porvider.dart';
import 'package:jobs_pot/system/system_providers.dart';

class JobsSummaryController extends StateNotifier<JobsSummaryEntity?> {
  JobsSummaryController(this.ref) : super(null);
  final Ref ref;

  Future getJobsSummary() async {
    ref.read(systemControllerProvider.notifier).showLoading();

    final getJobsSummaryResponse =
        await ref.read(homeRespositoryProvider).getJobsSummary();

    getJobsSummaryResponse.fold((l) {}, (r) {
      state = r.results;
    });

    ref.read(systemControllerProvider.notifier).hideLoading();
  }
}
