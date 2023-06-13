part of 'search_cubit.dart';

class SearchState extends Equatable {
  const SearchState({
    this.status = FormzSubmissionStatus.initial,
    this.medicationName = const MedicationNameFormInput.pure(),
    this.isValid = false,
  });

  final FormzSubmissionStatus status;
  final MedicationNameFormInput medicationName;
  final bool isValid;

  @override
  List<Object?> get props => [status, medicationName, isValid];

  SearchState copyWith({
    FormzSubmissionStatus? status,
    MedicationNameFormInput? medicationName,
    bool? isValid,
  }) {
    return SearchState(
      status: status ?? this.status,
      medicationName: medicationName ?? this.medicationName,
      isValid: isValid ?? this.isValid,
    );
  }
}
