import 'package:cima_client/l10n/l10n.dart';
import 'package:cima_client/medication_detail/medication_detail.dart';
import 'package:cima_model/cima_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MedicationDetailWidget extends StatelessWidget {
  const MedicationDetailWidget({required this.medicamento, super.key});

  final Medication medicamento;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final currentMedication = (context.watch<MedicationDetailBloc>().state
            is AvailableMedicationDetailState)
        ? (context.watch<MedicationDetailBloc>().state
                as AvailableMedicationDetailState)
            .medicamento
        : medicamento;

    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MedicationPhotoWidget(photo: currentMedication.photoMaterial),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    currentMedication.name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    currentMedication.laboratory ?? '',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    '${l10n.registration_number}: '
                    '${currentMedication.registerNumber}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  ButtonRowWidget(medicamento: currentMedication),
                  if (currentMedication.pharmaceuticalForm != null)
                    ListTile(
                      title: Text(l10n.pharmaceutical_form),
                      subtitle:
                          Text('${currentMedication.pharmaceuticalForm!.name}'),
                      leading: PharmaceuticalFormPhotoWidget(
                        photo: currentMedication.photoPharmaceuticalProduct,
                      ),
                    ),
                  if (currentMedication.dosage != null)
                    ListTile(
                      title: Text(l10n.dose),
                      subtitle: Text(currentMedication.dosage!),
                    ),
                  FeaturesWidget(medication: currentMedication),
                  // const PresentationsGridWidget(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
