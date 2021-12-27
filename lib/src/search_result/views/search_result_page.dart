import 'package:cima_client/src/search_result/bloc/search_medication_result_bloc.dart';
import 'package:cima_client/src/search_result/views/search_result_view.dart';
import 'package:cima_repository/cima_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultPage extends StatelessWidget {
  const SearchResultPage({
    Key? key,
    required this.params,
  }) : super(key: key);

  static const routeName = '/result';

  final Map<String, String> params;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => SearchMedicationResultBloc(
          cimaRepository: context.read<CimaRepository>(),
        )..add(Search(params: params)),
        child: const SearchResultView(),
      ),
    );
  }
}
