import 'package:my_badge/core/either.dart';
import 'package:my_badge/core/errors/failures.dart';
import 'package:my_badge/domain/entities/user.dart';
import 'package:my_badge/domain/repositories/user_repository.dart';
import 'package:equatable/equatable.dart';

class SearchUsersParams extends Equatable {
  final String? query;
  final String? city;
  final String? company;
  final List<String>? interests;
  final String? badgeId;

  const SearchUsersParams({
    this.query,
    this.city,
    this.company,
    this.interests,
    this.badgeId,
  });

  @override
  List<Object?> get props => [query, city, company, interests, badgeId];
}

class SearchUsersUsecase {
  final UserRepository repository;

  SearchUsersUsecase(this.repository);

  Future<Either<Failure, List<UserProfileSummary>>> call(
    SearchUsersParams params,
  ) async {
    try {
      final users = await repository.searchUsers(
        query: params.query,
        city: params.city,
        company: params.company,
        interests: params.interests,
        badgeId: params.badgeId,
      );
      return Right(users);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
