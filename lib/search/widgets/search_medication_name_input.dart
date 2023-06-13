import 'package:cima_client/l10n/l10n.dart';
import 'package:cima_client/search/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz_inputs/formz_inputs.dart';

class SearchMedicationNameInput extends StatelessWidget {
  const SearchMedicationNameInput({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocSelector<SearchCubit, SearchState, MedicationNameFormInput>(
      selector: (state) => state.medicationName,
      builder: (context, input) {
        return TextField(
          onChanged: (value) =>
              context.read<SearchCubit>().medicationNameChanged(value),
          decoration: InputDecoration(
            labelText: l10n.medication_name,
            errorText:
                input.isNotValid ? l10n.medication_name_min_3_characters : null,
          ),
        );
      },
    );
  }
}
