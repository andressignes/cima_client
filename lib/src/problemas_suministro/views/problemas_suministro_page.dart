import 'package:cima_client/src/core/widgets/cima_error.dart';
import 'package:cima_client/src/core/widgets/cima_loading.dart';
import 'package:cima_client/src/problemas_suministro/bloc/problemas_suministro_bloc.dart';
import 'package:cima_model/cima_model.dart';
import 'package:cima_repository/cima_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProblemasSuministroPage extends StatelessWidget {
  const ProblemasSuministroPage({Key? key}) : super(key: key);

  static const routeName = '/problemas_suministro';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ProblemasSuministroBloc(
              cimaRepository: context.read<CimaRepository>(),
            )..add(const GetActivos()),
        child: const _ProblemasSuministroView());
  }
}

class _ProblemasSuministroView extends StatelessWidget {
  const _ProblemasSuministroView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Problemas de Suministro'),
      ),
      body: BlocBuilder<ProblemasSuministroBloc, ProblemasSuministroState>(
          builder: (context, state) {
        if (state is ProblemasSuministroLoading) {
          return const CimaLoading();
        } else if (state is ProblemasSuministroLoaded) {
          return _ProblemasSuministroList(
              problemasSuministro: state.problemasSuministro);
        } else {
          return const CimaError();
        }
      }),
    );
  }
}

class _ProblemasSuministroList extends StatelessWidget {
  const _ProblemasSuministroList({
    Key? key,
    required this.problemasSuministro,
  }) : super(key: key);

  final List<ProblemaSuministro> problemasSuministro;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: problemasSuministro.length,
      itemBuilder: (context, index) {
        final problemaSuministro = problemasSuministro[index];
        return ListTile(
          title: Text(problemaSuministro.nombre ?? ''),
          subtitle: Text(
              DateTime.fromMillisecondsSinceEpoch(problemaSuministro.fini!)
                  .toIso8601String()),
        );
      },
    );
  }
}
