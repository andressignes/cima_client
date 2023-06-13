import 'package:cima_client/supply_problems/supply_problems.dart';
import 'package:cima_model/cima_model.dart' show SupplyProblems;
import 'package:flutter/material.dart';

class SupplyProblemsListWidget extends StatelessWidget {
  const SupplyProblemsListWidget({
    required this.supplyProblemsList,
    super.key,
  });

  final List<SupplyProblems> supplyProblemsList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: supplyProblemsList.length,
      itemBuilder: (context, index) => SupplyProblemItemWidget(
        supplyProblem: supplyProblemsList.elementAt(index),
      ),
    );
  }
}
