import 'package:cima_client/app/router/routes.dart';
import 'package:cima_client/search_result/search_result.dart';
import 'package:cima_model/cima_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MedicationItemList extends StatelessWidget {
  const MedicationItemList({super.key, required this.medication});

  final Medication medication;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Card(
          child: Row(
            children: [
              Expanded(
                child: PhotoItemList(photo: medication.photoMaterial),
              ),
              Expanded(
                flex: 3,
                child: ListTile(
                  title: Text(
                    medication.name ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.fade,
                  ),
                  subtitle: Text(
                    medication.laboratory ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () => context.pushNamed(
        Routes.medicationDetail.name,
        queryParams: {'nregistro': medication.registerNumber},
      ),
    );
  }
}
