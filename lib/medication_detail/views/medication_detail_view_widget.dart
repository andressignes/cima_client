import 'package:cima_client/l10n/l10n.dart';
import 'package:cima_client/medication_detail/medication_detail.dart';
import 'package:cima_model/cima_model.dart';
import 'package:flutter/material.dart';

class MedicationDetailWidget extends StatelessWidget {
  const MedicationDetailWidget({super.key, required this.medicamento});

  final Medicamento medicamento;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SingleChildScrollView(
      child: Column(
        children: [
          MedicationPhotoWidget(photo: medicamento.photoMaterialAs),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  medicamento.nombre ?? '',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  medicamento.labtitular ?? '',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                if (medicamento.nregistro != null)
                  Text(
                    '${l10n.registration_number}: ${medicamento.nregistro!}',
                    style: Theme.of(context).textTheme.caption,
                  ),
                ButtonRowWidget(medicamento: medicamento),
                if (medicamento.formaFarmaceutica != null)
                  ListTile(
                    title: Text(l10n.pharmaceutical_form),
                    subtitle: Text('${medicamento.formaFarmaceutica!.nombre}'),
                    leading: PharmaceuticalFormPhotoWidget(
                      photo: medicamento.photoFormaFarmaceutica,
                    ),
                  ),
                if (medicamento.dosis != null)
                  ListTile(
                    title: Text(l10n.dose),
                    subtitle: Text(medicamento.dosis!),
                  ),
                if (medicamento.cpresc != null)
                  AlertMedicationWidget(medicamento: medicamento),
              ],
            ),
          )
        ],
      ),
    );
  }
}
