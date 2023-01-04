import 'package:cima_client/search_result/search_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MedicationSearchDelegate extends SearchDelegate<void> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      const IconButton(onPressed: null, icon: Icon(Icons.qr_code_scanner)),
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
    search(context, query);
    return const MedicationListWidget();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    search(context, query);
    return const MedicationListWidget();
  }

  void search(BuildContext context, String query) {
    if (query.length < 3) return;
    context
        .read<SearchMedicationResultBloc>()
        .add(Search(params: {'nombre': query}));
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context);
  }
}
