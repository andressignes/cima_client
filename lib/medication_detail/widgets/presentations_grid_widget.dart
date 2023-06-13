import 'package:cima_client/app/router/routes.dart';
import 'package:cima_client/l10n/l10n.dart';
import 'package:cima_client/medication_detail/bloc/medication_detail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PresentationsGridWidget extends StatelessWidget {
  const PresentationsGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MedicationDetailBloc, MedicationDetailState>(
      builder: (context, state) {
        if (state is! AvailableMedicationDetailState) {
          return const SizedBox.shrink();
        }
        final presentations = state.medicamento.presentations ?? [];
        if (presentations.isEmpty) {
          return const SizedBox.shrink();
        }
        final l10n = context.l10n;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.presentations,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              height: 150,
              width: double.infinity,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final p = presentations[index];
                  return SizedBox(
                    width: 250,
                    child: Card(
                      child: ListTile(
                        onTap: () => context.pushNamed(
                          Routes.medicationDetail.name,
                          queryParameters: {'cn': p.nationalCode},
                        ),
                        title: Text(
                          p.name,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text(p.nationalCode),
                      ),
                    ),
                  );
                },
                itemCount: presentations.length,
              ),
            ),
          ],
        );
      },
    );
  }
}
