import 'package:cima_model/cima_model.dart';
import 'package:cima_repository/cima_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'supply_problems_event.dart';
part 'supply_problems_state.dart';

class SupplyProblemsBloc
    extends Bloc<SupplyProblemsEvent, SupplyProblemsState> {
  SupplyProblemsBloc({required CimaRepository cimaRepository})
      : _cimaRepository = cimaRepository,
        super(const Initial()) {
    on<GetActive>(_onGetActive);
  }

  final CimaRepository _cimaRepository;

  Future<void> _onGetActive(
    GetActive event,
    Emitter<SupplyProblemsState> emit,
  ) async {
    emit(const Loading());
    try {
      final result = await _cimaRepository
          .findProblemasSuministro(params: {'activos': '1'});
      emit(
        result.fold(
          (failure) => const Error(),
          Loaded.new,
        ),
      );
    } catch (_) {
      emit(const Error());
    }
  }
}
