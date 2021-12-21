import 'dart:developer';

import 'package:cima_client/src/core/widgets/pdf_button_widget.dart';
import 'package:cima_client/src/core/widgets/widgets.dart';
import 'package:cima_client/src/medication_detail/medication_detail.dart';
import 'package:cima_model/cima_model.dart';
import 'package:cima_repository/cima_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MedicationDetailPage extends StatelessWidget {
  final Medicamento _medicamento;

  const MedicationDetailPage({Key? key, required medicamento})
      : _medicamento = medicamento,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MedicationDetailBloc(cimaRepository: context.read<CimaRepository>())
            ..add(FetchMedicamento(nregistro: _medicamento.nregistro)),
      child: Scaffold(
        appBar: AppBar(),
        body: _MedicationDetailView(medicamento: _medicamento),
      ),
    );
  }
}

class _MedicationDetailView extends StatelessWidget {
  const _MedicationDetailView({
    Key? key,
    required Medicamento medicamento,
  })  : _medicamento = medicamento,
        super(key: key);

  final Medicamento _medicamento;

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
        return _MedicationCard(medicamento: _medicamento);
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
            fotos: _medicamento.fotos!,
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
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    PdfButtonWidget(
                      title: 'Ficha Tecnica',
                      url: _medicamento.docs?[0].url,
                    ),
                    PdfButtonWidget(
                      title: 'Prospecto',
                      url: _medicamento.docs?[1].url,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MedicationPhotoWidget extends StatelessWidget {
  const MedicationPhotoWidget({
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
        fotos!
            .firstWhere((foto) => foto.tipo == 'materialas')
            .url!
            .replaceAll('thumbnails', 'full'),
      );
    }
    return Container();
  }
}
