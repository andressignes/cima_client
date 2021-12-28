import 'dart:async';

import 'package:cima_model/cima_model.dart';
import 'package:cima_repository/cima_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'medication_detail_event.dart';
part 'medication_detail_state.dart';

class MedicationDetailBloc
    extends Bloc<MedicationDetailEvent, MedicationDetailState> {
  MedicationDetailBloc({required cimaRepository})
      : _cimaRepository = cimaRepository,
        super(Initial());

  final CimaRepository _cimaRepository;

  @override
  Stream<MedicationDetailState> mapEventToState(
    MedicationDetailEvent event,
  ) async* {
    if (event is FetchMedicamento) {
      yield* mapEventGetMedicamento(event);
    }
  }

  Stream<MedicationDetailState> mapEventGetMedicamento(
      FetchMedicamento event) async* {
    yield Loading();
    final _result = await _cimaRepository.getMedicamento(
      cn: event.cn,
      nregistro: event.nregistro,
    );
    yield _result.fold((l) => Error(), (medicamento) {
      return Available(medicamento: medicamento);
    });
  }
}
