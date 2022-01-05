import 'package:cima_client/src/medication_detail/views/medication_detail_page.dart';
import 'package:cima_model/cima_model.dart';
import 'package:flutter/material.dart';

class MedicationItemList extends StatelessWidget {
  const MedicationItemList({
    Key? key,
    required Medicamento medication,
  })  : _medication = medication,
        super(key: key);

  final Medicamento _medication;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  MedicationDetailPage(nregistro: _medication.nregistro))),
      child: Card(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: _PhotoItemList(photos: _medication.fotos),
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

class _PhotoItemList extends StatelessWidget {
  const _PhotoItemList({
    Key? key,
    required this.photos,
  }) : super(key: key);
  final List<Foto>? photos;
  static const photoType = 'materialas';

  @override
  Widget build(BuildContext context) {
    if (photos == null ||
        photos!.isEmpty ||
        photos!.indexWhere((photo) => photo.tipo == photoType) == -1) {
      return Image.asset('assets/images/no_image.png');
    }
    final urlPhoto =
        photos!.firstWhere((photo) => photo.tipo == photoType).url!;

    return Hero(
      tag: urlPhoto,
      child: Image.network(
        urlPhoto,
        loadingBuilder: (context, child, loadingProgress) =>
            loadingProgress == null
                ? child
                : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
