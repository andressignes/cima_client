import 'dart:developer';

import 'package:cima_client/app/router/routes.dart';
import 'package:cima_client/l10n/l10n.dart';
import 'package:cima_client/search/search.dart';
import 'package:cima_client/search_result/bloc/search_medication_result_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SearchSubmitButton extends StatelessWidget {
  const SearchSubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        log(state.toString());
        return ElevatedButton(
          onPressed: () {
            if (state.isValid) {
              final params = <String, String>{
                'nombre': state.medicationName.value
              };
              context
                  .read<SearchMedicationResultBloc>()
                  .add(Search(params: params));
              context.goNamed(
                Routes.searchResult.name,
                queryParameters: params,
              );
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
