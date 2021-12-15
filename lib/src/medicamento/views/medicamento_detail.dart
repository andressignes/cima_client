import 'package:cima_client/src/core/widgets/widgets.dart';
import 'package:cima_client/src/medicamento/bloc/medicamento_bloc.dart';
import 'package:cima_model/cima_model.dart';
import 'package:cima_repository/cima_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MedicationPage extends StatelessWidget {
  final Medicamento _medicamento;

  const MedicationPage({Key? key, required medicamento})
      : _medicamento = medicamento,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MedicamentoBloc(cimaRepository: context.read<CimaRepository>())
            ..add(FetchMedicamento(nregistro: _medicamento.nregistro)),
      child: Scaffold(
        appBar: AppBar(),
        body: Center(child: _MedicationBlocBuilder(medicamento: _medicamento)),
      ),
    );
  }
}

class _MedicationBlocBuilder extends StatelessWidget {
  const _MedicationBlocBuilder({
    Key? key,
    required Medicamento medicamento,
  })  : _medicamento = medicamento,
        super(key: key);

  final Medicamento _medicamento;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MedicamentoBloc, MedicamentoState>(
        builder: (context, state) {
      if (state is Error) {
        return const CimaError();
      } else if (state is Loading) {
        return const CimaLoading();
      } else if (state is Available) {
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
    return Stack(
      children: [
        Container(
            // color: Colors.red,
            ),
        SizedBox(
          // color: Colors.blue,
          height: 200,
          child: MedicamentoFoto(
            fotos: _medicamento.fotos!,
          ),
        ),
        Positioned.fill(
            left: 0,
            top: 160,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                _medicamento.nombre!,
                overflow: TextOverflow.ellipsis,
              ),
            )),
      ],
    );
  }
}
