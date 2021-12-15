part of 'authorized_bloc.dart';

class AuthorizedEvent extends Equatable {
  const AuthorizedEvent();

  @override
  List<Object?> get props => [];
}

class GetAuthorized extends AuthorizedEvent {
  const GetAuthorized({this.params});

  final Map<String, String>? params;

  @override
  List<Object?> get props => [params];
}
