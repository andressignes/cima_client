import 'package:cima_client/l10n/l10n.dart';
import 'package:cima_model/cima_model.dart';
import 'package:flutter/material.dart';

class TriangleIndicatorWidget extends StatelessWidget {
  const TriangleIndicatorWidget({super.key, required this.medication});

  final Medication medication;

  bool get hasTriangle => medication.hasTriangle ?? false;

  @override
  Widget build(BuildContext context) {
    if (!hasTriangle) {
      return const SizedBox.shrink();
    }
    final l10n = context.l10n;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          const RotatedBox(
            quarterTurns: 2,
            child: Icon(Icons.warning_sharp),
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              l10n.triangle_advice,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
        ],
      ),
    );
  }
}
