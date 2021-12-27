import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz_inputs/formz_inputs.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(const SearchState());

  void medicationNameChanged(String medicationName) {
    final medicamentoName = MedicationNameFormInput.dirty(medicationName);
    emit(
      state.copyWith(
        medicationName: MedicationNameFormInput.dirty(medicationName),
        status: Formz.validate([medicamentoName]),
      ),
    );
  }
}
