import 'package:cima_client/l10n/l10n.dart';
import 'package:cima_client/medication_detail/medication_detail.dart';
import 'package:cima_model/cima_model.dart';
import 'package:cima_repository/cima_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MedicationDetailPage extends StatelessWidget {
  const MedicationDetailPage({
    super.key,
    required this.medication,
  });

  static Page<void> page({required Medicamento medication}) =>
      MaterialPage<void>(child: MedicationDetailPage(medication: medication));

  final Medicamento medication;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocProvider(
      create: (context) =>
          MedicationDetailBloc(cimaRepository: context.read<CimaRepository>())
            ..add(
              FetchMedicamento(nregistro: medication.nregistro),
            ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.medication_detail_page_title),
        ),
        body: MedicationDetailWidget(medicamento: medication),
      ),
    );
  }
}
