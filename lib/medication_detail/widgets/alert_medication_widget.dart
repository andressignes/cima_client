import 'package:cima_model/cima_model.dart';
import 'package:flutter/material.dart';

class AlertMedicationWidget extends StatelessWidget {
  const AlertMedicationWidget({required this.medicamento, super.key});

  final Medication medicamento;
  String get conditionPrescriptions => medicamento.conditionPrescriptions ?? '';

  @override
  Widget build(BuildContext context) {
    if (conditionPrescriptions.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Icon(
            Icons.warning,
            color: Theme.of(context).colorScheme.error,
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              conditionPrescriptions,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.error,
                    fontStyle: FontStyle.italic,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
