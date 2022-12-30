part of 'search_medication_result_bloc.dart';

abstract class SearchMedicationResultState extends Equatable {
  const SearchMedicationResultState();

  @override
  List<Object?> get props => [];
}

class Initial extends SearchMedicationResultState {}

class Loading extends SearchMedicationResultState {}

class Error extends SearchMedicationResultState {}

class Available extends SearchMedicationResultState {
  const Available({required this.medicamentos});

  final List<Medicamento> medicamentos;

  @override
  List<Object?> get props => [medicamentos];
}
