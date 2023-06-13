import 'package:cima_client/l10n/l10n.dart';
import 'package:cima_model/cima_model.dart';
import 'package:flutter/material.dart';

class SupplyProblemsIndicatorWidget extends StatelessWidget {
  const SupplyProblemsIndicatorWidget({required this.medication, super.key});

  final Medication medication;

  bool get hasSupplyProblems => medication.haveSupplyProblems ?? false;

  @override
  Widget build(BuildContext context) {
    if (!hasSupplyProblems) {
      return const SizedBox.shrink();
    }
    final l10n = context.l10n;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          const Icon(Icons.warning_amber_outlined),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              l10n.supply_problems_advice,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}
