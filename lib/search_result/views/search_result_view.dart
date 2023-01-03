import 'package:cima_client/common/widgets/widgets.dart';
import 'package:cima_client/search_result/search_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultView extends StatelessWidget {
  const SearchResultView({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body:
          BlocBuilder<SearchMedicationResultBloc, SearchMedicationResultState>(
        builder: (context, state) {
          if (state is Initial) {
            return const CimaEmpty();
          } else if (state is Loading) {
            return const CimaLoading();
          } else if (state is AvailableSearchMedicationResultState) {
            return const MedicationListWidget();
          }
          return const CimaError();
        },
      ),
    );
  }
}
