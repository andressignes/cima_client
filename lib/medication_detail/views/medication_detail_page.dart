import 'package:cima_client/common/widgets/cima_loading.dart';
import 'package:cima_client/l10n/l10n.dart';
import 'package:cima_client/medication_detail/medication_detail.dart';
import 'package:cima_model/cima_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';

class MedicationDetailPage extends StatelessWidget {
  const MedicationDetailPage({
    required this.medication,
    super.key,
  });

  static Page<void> page({required Medication medication}) =>
      MaterialPage<void>(child: MedicationDetailPage(medication: medication));

  final Medication medication;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.medication_detail_page_title),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () => Share.share(
              'https://cima.aemps.es/cima/publico/detalle.html?'
              'nregistro=${medication.registerNumber}',
              subject: medication.name,
            ),
          ),
        ],
      ),
      body: BlocBuilder<MedicationDetailBloc, MedicationDetailState>(
        builder: (context, state) {
          switch (state) {
            case AvailableMedicationDetailState():
              return MedicationDetailWidget(medicamento: medication);
            case Initial():
            case Loading():
              return const CimaLoading();
          }
          return const SizedBox.shrink();
          // AvailableMedicationDetailState:
          // return MedicationDetailWidget(medicamento: medication);
        },
      ),
    );
  }
}
