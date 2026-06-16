import 'package:equatable/equatable.dart';

abstract class Either<L, R> {
  T fold<T>(T Function(L left) leftCase, T Function(R right) rightCase);
  bool get isLeft;
  bool get isRight;
  L? get left;
  R? get right;
}

class Left<L, R> extends Either<L, R> with EquatableMixin {
  final L value;
  Left(this.value);

  @override
  T fold<T>(T Function(L) leftCase, T Function(R) rightCase) => leftCase(value);

  @override
  bool get isLeft => true;

  @override
  bool get isRight => false;

  @override
  L? get left => value;

  @override
  R? get right => null;

  @override
  List<Object?> get props => [value];
}

class Right<L, R> extends Either<L, R> with EquatableMixin {
  final R value;
  Right(this.value);

  @override
  T fold<T>(T Function(L) leftCase, T Function(R) rightCase) => rightCase(value);

  @override
  bool get isLeft => false;

  @override
  bool get isRight => true;

  @override
  L? get left => null;

  @override
  R? get right => value;

  @override
  List<Object?> get props => [value];
}
