import 'package:cima_client/src/authorized/bloc/authorized_bloc.dart';
import 'package:cima_client/src/core/widgets/widgets.dart';
import 'package:cima_repository/cima_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/widgets/cima_populated_list.dart';

class LastAuthorizedPage extends StatelessWidget {
  const LastAuthorizedPage({Key? key}) : super(key: key);

  static const routeName = '/authorized';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthorizedBloc(
        cimaRepository: context.read<CimaRepository>(),
      )..add(
          const GetAuthorized(params: {'autorizados': '1'}),
        ),
      child: const LastAuthorizedBlocBuilder(),
    );
  }
}

class LastAuthorizedBlocBuilder extends StatelessWidget {
  const LastAuthorizedBlocBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthorizedBloc, AuthorizedState>(
        builder: (context, state) {
      if (state is AuthorizedStateInitial) {
        return const CimaEmpty();
      } else if (state is AuthorizedStateLoading) {
        return const CimaLoading();
      } else if (state is AuthorizedStateAvailable) {
        return CimaPopulatedList(medicamentos: state.medicamentos);
      } else if (state is AuthorizedStateError) {
        return const CimaError();
      } else {
        return const CimaError();
      }
    });
  }
}
