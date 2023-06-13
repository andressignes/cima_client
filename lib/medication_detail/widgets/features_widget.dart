import 'package:cima_client/l10n/l10n.dart';
import 'package:cima_client/medication_detail/medication_detail.dart';
import 'package:cima_model/cima_model.dart';
import 'package:flutter/material.dart';

class FeaturesWidget extends StatelessWidget {
  const FeaturesWidget({super.key, required this.medication});

  final Medication medication;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.features,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        AlertMedicationWidget(medicamento: medication),
        PrescriptionIndicatorWidget(medication: medication),
        AffectDrivingIndicatorWidget(medication: medication),
        TriangleIndicatorWidget(medication: medication),
        SupplyProblemsIndicatorWidget(medication: medication),
      ],
    );
  }
}
