import 'package:equatable/equatable.dart';

/// Abstract class that models the most common failures scenarios
abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

/// Server Failure
class ServerFailure extends Failure {}

/// Cache Failure
class CacheFailure extends Failure {}

/// Json Format not Valid
class FormatFailure extends Failure {}

/// Empty Data Failure
class NoDataFailure extends Failure {}
