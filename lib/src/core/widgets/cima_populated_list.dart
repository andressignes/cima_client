import 'package:cima_client/src/core/widgets/medication_item_list.dart';
import 'package:cima_model/cima_model.dart';
import 'package:flutter/material.dart';

class CimaPopulatedList extends StatelessWidget {
  final List<Medicamento> _medicamentos;

  const CimaPopulatedList({Key? key, required medicamentos})
      : _medicamentos = medicamentos,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _medicamentos.length,
      itemBuilder: (context, index) => MedicationItemList(
        medicamento: _medicamentos[index],
      ),
    );
  }
}
