import 'dart:developer';

import 'package:cima_client/src/medication_detail/views/medicamento_detail_page.dart';
import 'package:cima_model/cima_model.dart';
import 'package:flutter/material.dart';

class MedicamentoItemList extends StatelessWidget {
  const MedicamentoItemList({
    Key? key,
    required Medicamento medicamento,
  })  : _medicamento = medicamento,
        super(key: key);

  final Medicamento _medicamento;

  @override
  Widget build(BuildContext context) {
    log(_medicamento.toJson().toString());
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  MedicationDetailPage(medicamento: _medicamento))),
      child: Card(
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      child: FotoItemList(fotos: _medicamento.fotos)),
                )),
            Expanded(
              flex: 3,
              child: ListTile(
                title: Text(_medicamento.nombre ?? ''),
                subtitle: Text(_medicamento.labtitular ?? ''),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FotoItemList extends StatelessWidget {
  const FotoItemList({
    Key? key,
    required this.fotos,
  }) : super(key: key);
  final List<Foto>? fotos;

  @override
  Widget build(BuildContext context) {
    if (fotos == null || fotos!.isEmpty) {
      return Image.asset('assets/images/no_image.png');
    } else {
      return Image.network(
        fotos!.firstWhere((foto) => foto.tipo == 'materialas').url!,
      );
    }
  }
}
