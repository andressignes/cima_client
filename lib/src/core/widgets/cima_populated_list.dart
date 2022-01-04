import 'package:cima_client/src/core/widgets/medication_item_list.dart';
import 'package:cima_client/src/localization/l10n.dart';
import 'package:cima_model/cima_model.dart';
import 'package:flutter/material.dart';

class CimaPopulatedList extends StatelessWidget {
  final List<Medicamento> _medications;

  const CimaPopulatedList({Key? key, required medications})
      : _medications = medications,
        super(key: key);

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
