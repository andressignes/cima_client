import 'package:cima_client/l10n/l10n.dart';
import 'package:cima_model/cima_model.dart';
import 'package:flutter/material.dart';

class AffectDrivingIndicatorWidget extends StatelessWidget {
  const AffectDrivingIndicatorWidget({
    super.key,
    required this.medication,
  });

  final Medication medication;

  bool get affectsDriving => medication.affectsDriving ?? false;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Icon(
            Icons.drive_eta_outlined,
            color: affectsDriving ? Theme.of(context).colorScheme.error : null,
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              affectsDriving
                  ? l10n.affects_driving
                  : l10n.does_not_affect_driving,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: affectsDriving
                        ? Theme.of(context).colorScheme.error
                        : Theme.of(context).textTheme.titleMedium!.color,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
