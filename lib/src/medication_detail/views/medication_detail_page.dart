import 'dart:developer';

import 'package:cima_client/l10n/l10n.dart';
import 'package:cima_client/src/core/widgets/widgets.dart';
import 'package:cima_client/src/medication_detail/medication_detail.dart';
import 'package:cima_repository/cima_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MedicationDetailPage extends StatelessWidget {
  const MedicationDetailPage({
    super.key,
    String? nregistro,
    String? cn,
  })  : assert(nregistro != null || cn != null, 'nregistro or cn must be set'),
        _nregistro = nregistro,
        _cn = cn;

  static Page<void> get page =>
      MaterialPage<void>(child: MedicationDetailPage());

  final String? _nregistro;
  final String? _cn;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocProvider(
      create: (context) =>
          MedicationDetailBloc(cimaRepository: context.read<CimaRepository>())
            ..add(FetchMedicamento(nregistro: _nregistro, cn: _cn)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.medication_detail_page_title),
        ),
        body: const _MedicationDetailView(),
      ),
    );
  }
}

class _MedicationDetailView extends StatelessWidget {
  const _MedicationDetailView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MedicationDetailBloc, MedicationDetailState>(
        builder: (context, state) {
      if (state is Error) {
        return const CimaError();
      } else if (state is Loading) {
        return const CimaLoading();
      } else if (state is Available) {
        log(state.medicamento.toString());
        return MedicationDetailWidget(medicamento: state.medicamento);
      } else {
        return const CimaError();
      }
    });
  }
}
