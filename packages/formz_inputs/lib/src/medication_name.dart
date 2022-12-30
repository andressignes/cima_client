import 'package:formz/formz.dart';

enum MedicationNameValidationError { empty, tooShort }

class MedicationNameFormInput
    extends FormzInput<String, MedicationNameValidationError> {
  const MedicationNameFormInput.pure() : super.pure('');

  const MedicationNameFormInput.dirty([String value = '']) : super.dirty(value);

  @override
  MedicationNameValidationError? validator(String value) {
    if (value.isEmpty) {
      return MedicationNameValidationError.empty;
    }
    if (value.length < 3) {
      return MedicationNameValidationError.tooShort;
    }
    return null;
  }
}
