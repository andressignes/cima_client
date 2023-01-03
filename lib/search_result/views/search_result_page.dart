import 'package:cima_client/l10n/l10n.dart';
import 'package:cima_client/search_result/search_result.dart';
import 'package:flutter/material.dart';

class SearchResultPage extends StatelessWidget {
  const SearchResultPage({super.key});

  static Page<void> page() =>
      const MaterialPage<void>(child: SearchResultPage());

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SearchResultView(title: l10n.search_result_title);
  }
}
