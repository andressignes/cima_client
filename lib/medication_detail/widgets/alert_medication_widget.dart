import 'package:cima_model/cima_model.dart';
import 'package:flutter/material.dart';

class AlertMedicationWidget extends StatelessWidget {
  const AlertMedicationWidget({super.key, required this.medicamento});

  final Medication medicamento;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Icon(
            Icons.warning,
            color: Theme.of(context).errorColor,
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              medicamento.conditionPrescriptions!,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: Theme.of(context).errorColor,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
