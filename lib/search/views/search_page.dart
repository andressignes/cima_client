import 'package:cima_client/l10n/l10n.dart';
import 'package:cima_client/search/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  static Page<void> get page => const MaterialPage<void>(child: SearchPage());

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocProvider(
      create: (_) => SearchCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.search_title),
        ),
        body: const Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              SearchMedicationNameInput(),
              SizedBox(height: 8),
              SearchSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }
}
