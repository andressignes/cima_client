import 'dart:developer';

import 'package:cima_client/search_result/search_result.dart';
import 'package:cima_model/cima_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MedicationSearchDelegate extends SearchDelegate<Medication?> {
  MedicationSearchDelegate(this.searchMedicationResultBloc);

  final SearchMedicationResultBloc searchMedicationResultBloc;
  final minCharsSearch = 3;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      // const IconButton(onPressed: null, icon: Icon(Icons.qr_code_scanner)),
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          context.read<SearchMedicationResultBloc>().add(const ClearSearch());
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = '';
          }
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        context.read<SearchMedicationResultBloc>().add(const ClearSearch());
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.length < minCharsSearch) return const SizedBox.shrink();
    log('buildResults');
    return buildResultList(context, query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.length < minCharsSearch) return const SizedBox.shrink();
    log('buildSuggestions');
    return buildResultList(context, query);
  }

  Widget buildResultList(BuildContext context, String query) {
    searchMedicationResultBloc.add(Search(params: {'nombre': query}));
    return const MedicationListWidget();
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context);
  }
}
