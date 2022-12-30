import 'dart:developer';

import 'package:cima_client/app/router/routes.dart';
import 'package:cima_client/l10n/l10n.dart';
import 'package:cima_client/search/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz_inputs/formz_inputs.dart';
import 'package:go_router/go_router.dart';

class SearchSubmitButton extends StatelessWidget {
  const SearchSubmitButton({super.key});

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
