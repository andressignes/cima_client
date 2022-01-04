import 'package:cima_client/src/core/widgets/widgets.dart';
import 'package:cima_client/src/localization/l10n.dart';
import 'package:cima_client/src/search_result/search_result.dart';
import 'package:cima_repository/cima_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LastAuthorizedPage extends StatelessWidget {
  const LastAuthorizedPage({Key? key}) : super(key: key);

  static const routeName = '/authorized';

  static const _paramsSearch = {'autorizados': '1'};

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchMedicationResultBloc(
        cimaRepository: context.read<CimaRepository>(),
      )..add(
          const Search(params: _paramsSearch),
        ),
      child: const LastAuthorizedView(),
    );
  }
}

class LastAuthorizedView extends StatelessWidget {
  const LastAuthorizedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.recently_authorized),
      ),
      body:
          BlocBuilder<SearchMedicationResultBloc, SearchMedicationResultState>(
              builder: (context, state) {
        if (state is Initial) {
          return const CimaEmpty();
        } else if (state is Loading) {
          return const CimaLoading();
        } else if (state is Available) {
          return CimaPopulatedList(medications: state.medicamentos);
        } else if (state is Error) {
          return const CimaError();
        } else {
          return const CimaError();
        }
      }),
    );
  }
}
