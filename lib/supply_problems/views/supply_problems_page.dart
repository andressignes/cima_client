import 'package:cima_client/common/widgets/widgets.dart';
import 'package:cima_client/l10n/l10n.dart';
import 'package:cima_client/supply_problems/supply_problems.dart';
import 'package:cima_repository/cima_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SupplyProblemsPage extends StatelessWidget {
  const SupplyProblemsPage({super.key});

  static Page<void> get page => const MaterialPage(child: SupplyProblemsPage());

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocProvider(
      create: (context) => SupplyProblemsBloc(
        cimaRepository: context.read<CimaRepository>(),
      )..add(const GetActive()),
      child: Scaffold(
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
          },
        ),
      ),
    );
  }
}
