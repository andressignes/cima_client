import 'dart:developer';

import 'package:cima_client/src/core/widgets/widgets.dart';
import 'package:cima_client/src/medication_detail/medication_detail.dart';
import 'package:cima_model/cima_model.dart';
import 'package:cima_repository/cima_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MedicationDetailPage extends StatelessWidget {
  final String? _nregistro;
  final String? _cn;

  const MedicationDetailPage({
    Key? key,
    String? nregistro,
    String? cn,
  })  : assert(nregistro != null || cn != null),
        _nregistro = nregistro,
        _cn = cn,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MedicationDetailBloc(cimaRepository: context.read<CimaRepository>())
            ..add(FetchMedicamento(nregistro: _nregistro, cn: _cn)),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.star_border),
              onPressed: () {
                //TODO Add to favorites
              },
            )
          ],
        ),
        body: const _MedicationDetailView(),
      ),
    );
  }
}

class _MedicationDetailView extends StatelessWidget {
  const _MedicationDetailView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MedicationDetailBloc, MedicationDetailState>(
        builder: (context, state) {
      if (state is Error) {
        return const CimaError();
      } else if (state is Loading) {
        return const CimaLoading();
      } else if (state is Available) {
        log(state.medicamento.toString());
        return _MedicationCard(medicamento: state.medicamento);
      } else {
        return const CimaError();
      }
    });
  }
}

class _MedicationCard extends StatelessWidget {
  const _MedicationCard({
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
                  _medicamento.nombre!,
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  _medicamento.labtitular!,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Theme.of(context).colorScheme.primaryVariant),
                ),
                Text(
                  'Num Registro: ${_medicamento.nregistro!}',
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
              ],
            ),
          )
        ],
      ),
    );
  }
}
