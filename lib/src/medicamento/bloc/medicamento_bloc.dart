import 'dart:async';

import 'package:cima_model/cima_model.dart';
import 'package:cima_repository/cima_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'medicamento_event.dart';
part 'medicamento_state.dart';

class MedicamentoBloc extends Bloc<MedicamentoEvent, MedicamentoState> {
  MedicamentoBloc({required cimaRepository})
      : _cimaRepository = cimaRepository,
        super(Initial());

  final CimaRepository _cimaRepository;

  @override
  Stream<MedicamentoState> mapEventToState(
    MedicamentoEvent event,
  ) async* {
    if (event is FetchMedicamento) {
      yield* mapEventGetMedicamento(event);
    }
  }

  Stream<MedicamentoState> mapEventGetMedicamento(
      FetchMedicamento event) async* {
    yield Loading();
    final _result = await _cimaRepository.get(
      cn: event.cn,
      nregistro: event.nregistro,
    );
    yield _result.fold((l) => Error(), (medicamento) {
      return Available(medicamento: medicamento);
    });
  }
}
