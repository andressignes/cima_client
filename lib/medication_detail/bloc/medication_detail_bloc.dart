import 'dart:async';

import 'package:cima_model/cima_model.dart';
import 'package:cima_repository/cima_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'medication_detail_event.dart';
part 'medication_detail_state.dart';

class MedicationDetailBloc
    extends Bloc<MedicationDetailEvent, MedicationDetailState> {
  MedicationDetailBloc({required CimaRepository cimaRepository})
      : _cimaRepository = cimaRepository,
        super(Initial()) {
    on<FetchMedicamento>(_onFetchMedicamento);
  }

  final CimaRepository _cimaRepository;

  Future<void> _onFetchMedicamento(
    FetchMedicamento event,
    Emitter<MedicationDetailState> emit,
  ) async {
    emit(Loading());
    final result = await _cimaRepository.getMedicamento(
      cn: event.cn,
      nregistro: event.nregistro,
    );
    emit(
      result.fold(
        (_) => Error(),
        (medicamento) =>
            AvailableMedicationDetailState(medicamento: medicamento),
      ),
    );
  }
}
