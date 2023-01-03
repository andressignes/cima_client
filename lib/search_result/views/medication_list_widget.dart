import 'package:cima_client/common/widgets/widgets.dart';
import 'package:cima_client/search_result/search_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MedicationListWidget extends StatelessWidget {
  const MedicationListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchMedicationResultBloc, SearchMedicationResultState>(
      builder: (context, state) {
        if (state is AvailableSearchMedicationResultState) {
          final medications = state.medicamentos;
          if (medications.isEmpty) {
            return const CimaEmpty();
          }
          return ListView.builder(
            itemCount: medications.length,
            itemBuilder: (context, index) => MedicationItemList(
              medication: medications.elementAt(index),
            ),
          );
        } else if (state is Initial) {
          return const SizedBox.shrink();
        } else if (state is Loading) {
          return const CimaLoading();
        }
        return const CimaEmpty();
      },
    );
  }
}
