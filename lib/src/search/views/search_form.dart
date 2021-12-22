import 'package:cima_client/src/search/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz_inputs/formz_inputs.dart';

class SearchForm extends StatelessWidget {
  const SearchForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _MedicationNameInput(),
      ],
    );
  }
}

class _MedicationNameInput extends StatelessWidget {
  const _MedicationNameInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SearchCubit, SearchState, MedicationNameFormInput>(
        selector: (state) => state.medicationName,
        builder: (context, input) {
          return TextField(
            onChanged: (value) =>
                context.read<SearchCubit>().medicationNameChanged(value),
            decoration: InputDecoration(
              labelText: 'Medication Name',
              errorText: input.invalid ? 'Medication name is required' : null,
            ),
          );
        });
  }
}
