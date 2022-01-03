import 'package:cima_client/src/core/widgets/medication_item_list.dart';
import 'package:cima_client/src/localization/l10n.dart';
import 'package:cima_model/cima_model.dart';
import 'package:flutter/material.dart';

class CimaPopulatedList extends StatelessWidget {
  final List<Medicamento> _medicamentos;

  const CimaPopulatedList({Key? key, required medicamentos})
      : _medicamentos = medicamentos,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    if (_medicamentos.isEmpty) {
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
      itemCount: _medicamentos.length,
      itemBuilder: (context, index) => MedicationItemList(
        medicamento: _medicamentos[index],
      ),
    );
  }
}
