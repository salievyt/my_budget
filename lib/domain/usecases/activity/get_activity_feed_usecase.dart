import 'package:my_badge/core/either.dart';
import 'package:my_badge/core/errors/failures.dart';
import 'package:my_badge/domain/entities/activity.dart';
import 'package:my_badge/domain/repositories/activity_repository.dart';
import 'package:equatable/equatable.dart';

class GetActivityFeedParams extends Equatable {
  final int limit;
  final int offset;

  const GetActivityFeedParams({this.limit = 20, this.offset = 0});

  @override
  List<Object?> get props => [limit, offset];
}

class GetActivityFeedUsecase {
  final ActivityRepository repository;

  GetActivityFeedUsecase(this.repository);

  Future<Either<Failure, List<Activity>>> call(
    GetActivityFeedParams params,
  ) async {
    try {
      final activities = await repository.getActivityFeed(
        limit: params.limit,
        offset: params.offset,
      );
      return Right(activities);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
