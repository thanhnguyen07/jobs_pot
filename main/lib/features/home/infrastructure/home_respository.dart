import 'package:fpdart/fpdart.dart';
import 'package:models/entities/jobs_summary_response/jobs_summary_response_entity.dart';
import 'package:models/entities/recent_list_response/recent_list_response_entity.dart';
import 'package:models/failures/failure.dart';
import 'package:jobs_pot/features/home/domain/respositories/home_respository_interface.dart';
import 'package:jobs_pot/main.dart';
import 'package:jobs_pot/system/system_providers.dart';
import 'package:network/network.dart';

class HomeRespinsitory implements HomeRespositoryInterface {
  late ApiClient _apiClient;

  HomeRespinsitory() {
    _apiClient =
        appProvider.read(apiControllerProvider.notifier).getAppApiClient();
  }

  @override
  Future<Either<Failure, JobsSummaryResponseEntity>> getJobsSummary() async {
    try {
      final jobsSummaryResponse = await _apiClient.getJobsSummary();

      return right(JobsSummaryResponseEntity.fromJson(jobsSummaryResponse));
    } catch (error) {
      return left(const Failure.empty());
    }
  }

  @override
  Future<Either<Failure, RecentListResponseEntity>> getRecentList() async {
    try {
      final recentListResponse = await _apiClient.getRecentList();

      return right(RecentListResponseEntity.fromJson(recentListResponse));
    } catch (error) {
      return left(const Failure.empty());
    }
  }
}
