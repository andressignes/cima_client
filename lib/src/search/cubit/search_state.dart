part of 'search_cubit.dart';

class SearchState extends Equatable {
  const SearchState({
    this.status = FormzStatus.pure,
    this.medicationName = const MedicationNameFormInput.pure(),
  });

  final FormzStatus status;
  final MedicationNameFormInput medicationName;

  @override
  List<Object?> get props => [status, medicationName];

  SearchState copyWith({
    FormzStatus? status,
    MedicationNameFormInput? medicationName,
  }) {
    return SearchState(
      status: status ?? this.status,
      medicationName: medicationName ?? this.medicationName,
    );
  }
}
