import 'package:bloc/bloc.dart';
import 'package:cima_model/cima_model.dart';
import 'package:cima_repository/cima_repository.dart';
import 'package:equatable/equatable.dart';

part 'supply_problems_event.dart';
part 'supply_problems_state.dart';

class SupplyProblemsBloc
    extends Bloc<SupplyProblemsEvent, SupplyProblemsState> {
  SupplyProblemsBloc({required CimaRepository cimaRepository})
      : _cimaRepository = cimaRepository,
        super(const Initial());

  final CimaRepository _cimaRepository;

  @override
  Stream<SupplyProblemsState> mapEventToState(
    SupplyProblemsEvent event,
  ) async* {
    if (event is GetActive) {
      yield* _mapGetActivosToState();
    }
  }

  Stream<SupplyProblemsState> _mapGetActivosToState() async* {
    yield const Loading();
    try {
      final result = await _cimaRepository
          .findProblemasSuministro(params: {'activos': '1'});
      yield result.fold(
        (failure) => const Error(),
        (activos) => Loaded(activos),
      );
    } catch (_) {
      yield const Error();
    }
  }
}
