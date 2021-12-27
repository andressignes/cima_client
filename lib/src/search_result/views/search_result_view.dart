import 'package:cima_client/src/authorized/bloc/authorized_bloc.dart';
import 'package:cima_client/src/core/widgets/cima_populated_list.dart';
import 'package:cima_client/src/core/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultView extends StatelessWidget {
  const SearchResultView({Key? key}) : super(key: key);

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
