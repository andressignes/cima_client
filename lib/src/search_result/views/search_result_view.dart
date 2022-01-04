import 'package:cima_client/src/core/widgets/widgets.dart';
import 'package:cima_client/src/search_result/search_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultView extends StatelessWidget {
  const SearchResultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child:
          BlocBuilder<SearchMedicationResultBloc, SearchMedicationResultState>(
              builder: (context, state) {
        if (state is Initial) {
          return const CimaEmpty();
        } else if (state is Loading) {
          return const CimaLoading();
        } else if (state is Available) {
          return CimaPopulatedList(medications: state.medicamentos);
        } else if (state is Error) {
          return const CimaError();
        } else {
          return const CimaError();
        }
      }),
    );
  }
}
