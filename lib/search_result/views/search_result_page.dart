import 'package:cima_client/l10n/l10n.dart';
import 'package:cima_client/search_result/search_result.dart';
import 'package:cima_repository/cima_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultPage extends StatelessWidget {
  const SearchResultPage({
    super.key,
    required this.params,
  });

  static Page<void> page({
    required Map<String, String> params,
  }) =>
      MaterialPage<void>(
        child: SearchResultPage(params: params),
      );

  final Map<String, String> params;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocProvider(
      create: (context) => SearchMedicationResultBloc(
        cimaRepository: context.read<CimaRepository>(),
      )..add(Search(params: params)),
      child: SearchResultView(title: l10n.search_result_title),
    );
  }
}
