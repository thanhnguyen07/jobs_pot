import 'package:fpdart/fpdart.dart';
import 'package:jobs_pot/features/authentication/domain/failures/failure.dart';
import 'package:jobs_pot/features/home/domain/entities/jobs_summary_response_entity.dart';

abstract class HomeRespositoryInterface {
  Future<Either<Failure, JobsSummaryResponseEntity>> getJobsSummary();
}
