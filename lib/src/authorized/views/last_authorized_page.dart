import 'package:cima_client/src/core/widgets/widgets.dart';
import 'package:cima_client/src/search_result/bloc/search_medication_result_bloc.dart';
import 'package:cima_repository/cima_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/widgets/cima_populated_list.dart';

class LastAuthorizedPage extends StatelessWidget {
  const LastAuthorizedPage({Key? key}) : super(key: key);

  static const routeName = '/authorized';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchMedicationResultBloc(
        cimaRepository: context.read<CimaRepository>(),
      )..add(
          const Search(params: {'autorizados': '1'}),
        ),
      child: const LastAuthorizedBlocBuilder(),
    );
  }
}

class LastAuthorizedBlocBuilder extends StatelessWidget {
  const LastAuthorizedBlocBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Autorizados recientemente'),
      ),
      body:
          BlocBuilder<SearchMedicationResultBloc, SearchMedicationResultState>(
              builder: (context, state) {
        if (state is Initial) {
          return const CimaEmpty();
        } else if (state is Loading) {
          return const CimaLoading();
        } else if (state is Available) {
          return CimaPopulatedList(medicamentos: state.medicamentos);
        } else if (state is Error) {
          return const CimaError();
        } else {
          return const CimaError();
        }
      }),
    );
  }
}
