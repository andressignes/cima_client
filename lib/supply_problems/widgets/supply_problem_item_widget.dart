import 'package:cima_client/app/router/routes.dart';
import 'package:cima_client/l10n/l10n.dart';
import 'package:cima_model/cima_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class SupplyProblemItemWidget extends StatelessWidget {
  const SupplyProblemItemWidget({
    super.key,
    required this.supplyProblem,
  });

  final SupplyProblems supplyProblem;

  DateFormat get dateFormat => DateFormat('dd/MM/yyyy');

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final start = supplyProblem.fini != null
        ? dateFormat
            .format(DateTime.fromMillisecondsSinceEpoch(supplyProblem.fini!))
        : '';
    final end = supplyProblem.ffin != null
        ? dateFormat
            .format(DateTime.fromMillisecondsSinceEpoch(supplyProblem.ffin!))
        : '';
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  supplyProblem.nombre ?? '',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  supplyProblem.observ ?? '',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (supplyProblem.fini != null)
                      Text('${l10n.from}: $start')
                    else
                      const SizedBox.shrink(),
                    if (supplyProblem.ffin != null)
                      Text('${l10n.to}: $end')
                    else
                      const SizedBox.shrink(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      onTap: () => context.pushNamed(
        Routes.medicationDetail.name,
        queryParams: {'cn': supplyProblem.cn},
      ),
    );
  }
}
