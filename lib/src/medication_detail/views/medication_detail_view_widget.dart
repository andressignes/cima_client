import 'package:cima_client/src/core/widgets/widgets.dart';
import 'package:cima_client/src/medication_detail/medication_detail.dart';
import 'package:cima_model/cima_model.dart';
import 'package:flutter/material.dart';

class MedicationDetailWidget extends StatelessWidget {
  const MedicationDetailWidget({
    Key? key,
    required Medicamento medicamento,
  })  : _medicamento = medicamento,
        super(key: key);

  final Medicamento _medicamento;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          MedicationPhotoWidget(
            fotos: _medicamento.fotos,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _medicamento.nombre ?? '',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  _medicamento.labtitular ?? '',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Theme.of(context).colorScheme.primaryVariant),
                ),
                Text(
                  'Num. Registro: ${_medicamento.nregistro ?? ''}',
                  style: Theme.of(context).textTheme.caption,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      PdfButtonWidget(
                        title: 'Ficha Tecnica',
                        url: _medicamento.docs
                            ?.firstWhere(
                              (element) => element.tipo == 1,
                              orElse: () => Documento(),
                            )
                            .url,
                      ),
                      PdfButtonWidget(
                        title: 'Prospecto',
                        url: _medicamento.docs
                            ?.firstWhere(
                              (element) => element.tipo == 2,
                              orElse: () => Documento(),
                            )
                            .url,
                      ),
                    ],
                  ),
                ),
                _medicamento.formaFarmaceutica != null
                    ? ListTile(
                        title: const Text('Forma Farmaceutica'),
                        subtitle:
                            Text('${_medicamento.formaFarmaceutica!.nombre}'),
                        leading: PharmaceuticalFormPhotoWidget(
                          fotos: _medicamento.fotos,
                        ),
                      )
                    : const SizedBox.shrink(),
                _medicamento.dosis != null
                    ? ListTile(
                        title: const Text('Dosis'),
                        subtitle: Text(_medicamento.dosis!),
                      )
                    : const SizedBox.shrink(),
                _medicamento.cpresc != null
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            const Icon(Icons.warning, color: Colors.redAccent),
                            const SizedBox(width: 8),
                            Flexible(
                              child: Text(
                                _medicamento.cpresc!,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(
                                      fontStyle: FontStyle.italic,
                                      color: Colors.redAccent,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
