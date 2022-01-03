import 'dart:developer';

import 'package:cima_client/src/search/cubit/search_cubit.dart';
import 'package:cima_client/src/search_result/views/search_result_page.dart';
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
        _SubmitButton(),
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
              labelText: 'Nombre del medicamento',
              errorText: input.invalid
                  ? 'Introduce 3 caracteres como minimo para buscar'
                  : null,
            ),
          );
        });
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        log(state.status.toString());
        return ElevatedButton(
          onPressed: () {
            if (state.status.isValid) {
              Map<String, String> params = {
                'nombre': state.medicationName.value
              };
              Navigator.pushReplacementNamed(
                context,
                SearchResultPage.routeName,
                arguments: params,
              );
            } else {
              return;
            }
          },
          child: const Text('Buscar'),
        );
      },
    );
  }
}
