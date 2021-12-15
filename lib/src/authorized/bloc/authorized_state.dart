part of 'authorized_bloc.dart';

abstract class AuthorizedState extends Equatable {
  const AuthorizedState();

  @override
  List<Object?> get props => [];
}

class AuthorizedStateInitial extends AuthorizedState {}

class AuthorizedStateLoading extends AuthorizedState {}

class AuthorizedStateError extends AuthorizedState {}

class AuthorizedStateAvailable extends AuthorizedState {
  const AuthorizedStateAvailable({required this.medicamentos});

  final List<Medicamento> medicamentos;

  @override
  List<Object?> get props => [medicamentos];
}
