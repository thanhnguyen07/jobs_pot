import 'package:fpdart/fpdart.dart';
import 'package:models/entities/export.dart';
import 'package:models/failures/failure.dart';

abstract class HomeRespositoryInterface {
  Future<Either<Failure, JobsSummaryResponseEntity>> getJobsSummary();
  Future<Either<Failure, RecentListResponseEntity>> getRecentList();
}
