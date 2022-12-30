import 'package:cima_client/l10n/l10n.dart';
import 'package:cima_client/src/search/cubit/search_cubit.dart';
import 'package:cima_client/src/search/views/search_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  static Page<void> get page => const MaterialPage<void>(child: SearchPage());

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SearchCubit()),
      ],
      child: const SearchView(),
    );
  }
}

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.search_title),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8),
        child: Center(child: SearchForm()),
      ),
    );
  }
}
