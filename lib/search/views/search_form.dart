import 'dart:developer';

import 'package:cima_client/app/router/routes.dart';
import 'package:cima_client/l10n/l10n.dart';
import 'package:cima_client/search/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz_inputs/formz_inputs.dart';
import 'package:go_router/go_router.dart';

class SearchForm extends StatelessWidget {
  const SearchForm({super.key});

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
  const _MedicationNameInput();

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
                input.invalid ? l10n.medication_name_min_3_characters : null,
          ),
        );
      },
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        log(state.status.toString());
        return ElevatedButton(
          onPressed: () {
            if (state.status.isValid) {
              final params = <String, dynamic>{
                'nombre': state.medicationName.value
              };
              context.goNamed(Routes.searchResult.name, queryParams: params);
            } else {
              return;
            }
          },
          child: Text(l10n.search_title),
        );
      },
    );
  }
}
