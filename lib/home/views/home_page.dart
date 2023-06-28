import 'package:cima_client/l10n/l10n.dart';
import 'package:cima_client/search/search.dart';
import 'package:cima_client/search_result/bloc/search_medication_result_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Page<void> page({Key? key}) => MaterialPage(child: HomePage(key: key));

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.home_page_title),
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.search),
        //     onPressed: () {
        //       showSearch(
        //         context: context,
        //         delegate: MedicationSearchDelegate(),
        //       );
        //     },
        //   ),
        // ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              l10n.home_page_paragraph1,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              l10n.home_page_paragraph2,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            Text(
              l10n.home_page_paragraph3,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            // const LinksRowWidget(),
          ],
        ),
      ),
      // drawer: const DrawerWidget(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'search',
            onPressed: () {
              showSearch(
                context: context,
                delegate: MedicationSearchDelegate(
                  context.read<SearchMedicationResultBloc>(),
                ),
              );
            },
            child: const Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}
