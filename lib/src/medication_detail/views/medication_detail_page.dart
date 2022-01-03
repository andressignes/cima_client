import 'dart:developer';

import 'package:cima_client/src/core/widgets/widgets.dart';
import 'package:cima_client/src/medication_detail/medication_detail.dart';
import 'package:cima_repository/cima_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MedicationDetailPage extends StatelessWidget {
  final String? _nregistro;
  final String? _cn;

  const MedicationDetailPage({
    Key? key,
    String? nregistro,
    String? cn,
  })  : assert(nregistro != null || cn != null),
        _nregistro = nregistro,
        _cn = cn,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MedicationDetailBloc(cimaRepository: context.read<CimaRepository>())
            ..add(FetchMedicamento(nregistro: _nregistro, cn: _cn)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Detalle del medicamento'),
          // actions: [
          // IconButton(
          //   icon: const Icon(Icons.star_border),
          //   onPressed: () {
          //   },
          // )
          // ],
        ),
        body: const _MedicationDetailView(),
      ),
    );
  }
}

class _MedicationDetailView extends StatelessWidget {
  const _MedicationDetailView({
    Key? key,
  }) : super(key: key);

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
