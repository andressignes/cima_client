import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz_inputs/formz_inputs.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(const SearchState());

  void medicationNameChanged(String medicationName) {
    final medicamentoName = MedicationNameFormInput.dirty(medicationName);
    emit(
      state.copyWith(
        medicationName: MedicationNameFormInput.dirty(medicationName),
        isValid: Formz.validate([medicamentoName]),
      ),
    );
  }
}
