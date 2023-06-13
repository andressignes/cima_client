import 'package:cima_client/l10n/l10n.dart';
import 'package:cima_model/cima_model.dart';
import 'package:flutter/material.dart';

class PrescriptionIndicatorWidget extends StatelessWidget {
  const PrescriptionIndicatorWidget({super.key, required this.medication});

  final Medication medication;

  bool get needPrescription => medication.needPrescription ?? false;

  @override
  Widget build(BuildContext context) {
    if (!needPrescription) return const SizedBox.shrink();
    final l10n = context.l10n;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          const Icon(Icons.info_outline),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              needPrescription
                  ? l10n.prescription_required
                  : l10n.prescription_not_required,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}
