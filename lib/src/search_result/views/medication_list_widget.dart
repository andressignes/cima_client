import 'package:cima_client/l10n/l10n.dart';
import 'package:cima_client/src/search_result/views/medication_item_list.dart';
import 'package:cima_model/cima_model.dart';
import 'package:flutter/material.dart';

class MedicationListWidget extends StatelessWidget {
  const MedicationListWidget({
    super.key,
    required List<Medicamento> medications,
  }) : _medications = medications;
  final List<Medicamento> _medications;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    if (_medications.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Text(
            l10n.no_results,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      );
    }
    return ListView.builder(
      itemCount: _medications.length,
      itemBuilder: (context, index) => MedicationItemList(
        medication: _medications[index],
      ),
    );
  }
}
