import 'package:cima_client/src/medication_detail/views/medication_detail_page.dart';
import 'package:cima_client/src/search_result/search_result.dart';
import 'package:cima_model/cima_model.dart';
import 'package:flutter/material.dart';

class MedicationItemList extends StatelessWidget {
  const MedicationItemList({
    super.key,
    required Medicamento medication,
  }) : _medication = medication;

  final Medicamento _medication;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute<void>(
              builder: (context) =>
                  MedicationDetailPage(nregistro: _medication.nregistro))),
      child: Card(
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: PhotoItemList(photo: _medication.photoMaterialAs),
              ),
            ),
            Expanded(
              flex: 3,
              child: ListTile(
                title: Text(_medication.nombre ?? ''),
                subtitle: Text(_medication.labtitular ?? ''),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
