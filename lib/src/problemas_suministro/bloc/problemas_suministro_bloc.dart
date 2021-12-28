import 'package:bloc/bloc.dart';
import 'package:cima_model/cima_model.dart';
import 'package:cima_repository/cima_repository.dart';
import 'package:equatable/equatable.dart';

part 'problemas_suministro_event.dart';
part 'problemas_suministro_state.dart';

class ProblemasSuministroBloc
    extends Bloc<ProblemasSuministroEvent, ProblemasSuministroState> {
  ProblemasSuministroBloc({required CimaRepository cimaRepository})
      : _cimaRepository = cimaRepository,
        super(const ProblemasSuministroInitial());

  final CimaRepository _cimaRepository;

  @override
  Stream<ProblemasSuministroState> mapEventToState(
    ProblemasSuministroEvent event,
  ) async* {
    if (event is GetActivos) {
      yield* _mapGetActivosToState();
    }
  }

  Stream<ProblemasSuministroState> _mapGetActivosToState() async* {
    yield const ProblemasSuministroLoading();
    try {
      final result = await _cimaRepository
          .findProblemasSuministro(params: {'activos': '1'});
      yield result.fold(
        (failure) => const ProblemasSuministroError(),
        (activos) => ProblemasSuministroLoaded(activos),
      );
    } catch (_) {
      yield const ProblemasSuministroError();
    }
  }
}
