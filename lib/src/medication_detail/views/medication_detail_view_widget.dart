import 'package:cima_client/src/core/widgets/widgets.dart';
import 'package:cima_client/src/localization/l10n.dart';
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
    final l10n = context.l10n;
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
                      color: Theme.of(context).colorScheme.primaryContainer),
                ),
                Text(
                  '${l10n.registration_number}: ${_medicamento.nregistro ?? ''}',
                  style: Theme.of(context).textTheme.caption,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      PdfButtonWidget(
                        title: l10n.technical_profile,
                        url: _medicamento
                            .getDocumento(TipoDocumento.fichaTecnica)
                            ?.url,
                      ),
                      PdfButtonWidget(
                        title: l10n.prospect,
                        url: _medicamento
                            .getDocumento(TipoDocumento.prospecto)
                            ?.url,
                      ),
                    ],
                  ),
                ),
                _medicamento.formaFarmaceutica != null
                    ? ListTile(
                        title: Text(l10n.pharmaceutical_form),
                        subtitle:
                            Text('${_medicamento.formaFarmaceutica!.nombre}'),
                        leading: PharmaceuticalFormPhotoWidget(
                          fotos: _medicamento.fotos,
                        ),
                      )
                    : const SizedBox.shrink(),
                _medicamento.dosis != null
                    ? ListTile(
                        title: Text(l10n.dose),
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
