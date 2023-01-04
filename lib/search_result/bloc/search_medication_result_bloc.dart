import 'dart:async';

import 'package:cima_model/cima_model.dart';
import 'package:cima_repository/cima_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_medication_result_event.dart';
part 'search_medication_result_state.dart';

class SearchMedicationResultBloc
    extends Bloc<SearchMedicationResultEvent, SearchMedicationResultState> {
  SearchMedicationResultBloc({required CimaRepository cimaRepository})
      : _cimaRepository = cimaRepository,
        super(Initial()) {
    on<Search>(_onSearch);
    on<ClearSearch>(_onClearSearch);
  }

  final CimaRepository _cimaRepository;

  Future<void> _onSearch(
    Search event,
    Emitter<SearchMedicationResultState> emit,
  ) async {
    emit(Loading());
    final result = await _cimaRepository.findMedications(params: event.params);

    emit(
      result.fold(
        (error) => Error(),
        (medications) {
          return AvailableSearchMedicationResultState(
            medicamentos: medications,
          );
        },
      ),
    );
  }

  void _onClearSearch(
    ClearSearch event,
    Emitter<SearchMedicationResultState> emit,
  ) {
    emit(Initial());
  }
}
