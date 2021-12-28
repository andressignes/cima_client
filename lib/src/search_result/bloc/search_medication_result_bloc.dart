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
        super(Initial());

  final CimaRepository _cimaRepository;

  @override
  Stream<SearchMedicationResultState> mapEventToState(
      SearchMedicationResultEvent event) async* {
    if (event is Search) {
      yield* mapGetAuthorizedEventToState(event);
    }
  }

  Stream<SearchMedicationResultState> mapGetAuthorizedEventToState(
      Search event) async* {
    yield Loading();
    final result = await _cimaRepository.findMedications(params: event.params);

    yield result.fold(
      (error) => Error(),
      (medications) {
        return Available(medicamentos: medications);
      },
    );
  }
}
