import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/features/home/home_porvider.dart';
import 'package:jobs_pot/utils/utils.dart';
import 'package:models/entities/jobs_summary/jobs_summary_entity.dart';

class JobsSummaryController extends StateNotifier<JobsSummaryEntity?> {
  JobsSummaryController(this.ref) : super(null);
  final Ref ref;

  Future getJobsSummary() async {
    Utils.showLoading();

    final getJobsSummaryResponse =
        await ref.read(homeRespositoryProvider).getJobsSummary();

    getJobsSummaryResponse.fold((l) {}, (r) {
      state = r.results;
    });

    Utils.hideLoading();
  }

  Future getRecentList() async {
    Utils.showLoading();

    final getJobsSummaryResponse =
        await ref.read(homeRespositoryProvider).getJobsSummary();

    getJobsSummaryResponse.fold((l) {}, (r) {
      state = r.results;
    });

    Utils.hideLoading();
  }
}
