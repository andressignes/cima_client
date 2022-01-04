import 'package:cima_client/src/core/widgets/cima_error.dart';
import 'package:cima_client/src/core/widgets/cima_loading.dart';
import 'package:cima_client/src/localization/l10n.dart';
import 'package:cima_client/src/supply_problems/bloc/supply_problems_bloc.dart';
import 'package:cima_client/src/supply_problems/views/supply_problems_list_view.dart';
import 'package:cima_repository/cima_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SupplyProblemsPage extends StatelessWidget {
  const SupplyProblemsPage({Key? key}) : super(key: key);

  static const routeName = '/supply_problems';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => SupplyProblemsBloc(
              cimaRepository: context.read<CimaRepository>(),
            )..add(const GetActive()),
        child: const _SupplyProblemsView());
  }
}

class _SupplyProblemsView extends StatelessWidget {
  const _SupplyProblemsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.supplier_problems_title),
      ),
      body: BlocBuilder<SupplyProblemsBloc, SupplyProblemsState>(
          builder: (context, state) {
        if (state is Loading) {
          return const CimaLoading();
        } else if (state is Loaded) {
          return SupplyProblemsListWidget(
            supplyProblemsList: state.problemasSuministro,
          );
        } else {
          return const CimaError();
        }
      }),
    );
  }
}
