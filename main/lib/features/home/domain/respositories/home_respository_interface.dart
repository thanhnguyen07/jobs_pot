import 'package:fpdart/fpdart.dart';
import 'package:models/entities/jobs_summary_response/jobs_summary_response_entity.dart';
import 'package:models/entities/recent_list_response/recent_list_response_entity.dart';
import 'package:models/failures/failure.dart';

abstract class HomeRespositoryInterface {
  Future<Either<Failure, JobsSummaryResponseEntity>> getJobsSummary();
  Future<Either<Failure, RecentListResponseEntity>> getRecentList();
}
