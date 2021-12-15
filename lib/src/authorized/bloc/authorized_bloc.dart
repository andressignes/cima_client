import 'package:cima_model/cima_model.dart';
import 'package:cima_repository/cima_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authorized_event.dart';
part 'authorized_state.dart';

class AuthorizedBloc extends Bloc<AuthorizedEvent, AuthorizedState> {
  AuthorizedBloc({required CimaRepository cimaRepository})
      : _cimaRepository = cimaRepository,
        super(AuthorizedStateInitial());

  final CimaRepository _cimaRepository;

  @override
  Stream<AuthorizedState> mapEventToState(AuthorizedEvent event) async* {
    if (event is GetAuthorized) {
      yield* mapGetAuthorizedEventToState(event);
    }
  }

  Stream<AuthorizedState> mapGetAuthorizedEventToState(
      GetAuthorized event) async* {
    yield AuthorizedStateLoading();
    final result = await _cimaRepository.authorizedList(params: event.params);

    yield result.fold(
      (error) => AuthorizedStateError(),
      (medications) {
        return AuthorizedStateAvailable(medicamentos: medications);
      },
    );
  }
}
