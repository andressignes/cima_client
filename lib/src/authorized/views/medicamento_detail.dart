import 'package:cima_client/src/core/widgets/medicamento_foto.dart';
import 'package:cima_client/src/medicamento/views/medicamento_detail.dart';
import 'package:cima_model/cima_model.dart';
import 'package:flutter/material.dart';

class CardMedicamento extends StatelessWidget {
  final Medicamento _medicamento;

  // final ShapeBorder _shape;

  const CardMedicamento({Key? key, required medicamento})
      : _medicamento = medicamento,
        // _shape = shape,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint(_medicamento.nregistro.toString());
    return Card(
      // This ensures that the Card's children (including the ink splash) are clipped correctly.
      clipBehavior: Clip.antiAlias,
      // shape: _shape,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      MedicationPage(medicamento: _medicamento)));
          debugPrint('Card was tapped');
        },
        // Generally, material cards use onSurface with 12% opacity for the pressed state.
        splashColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
        // Generally, material cards do not have a highlight overlay.
        highlightColor: Colors.transparent,
        child: MedicationContent(medicamento: _medicamento),
      ),
    );
  }
}

class MedicationContent extends StatelessWidget {
  const MedicationContent({Key? key, required this.medicamento})
      : super(key: key);

  final Medicamento medicamento;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final descriptionStyle = theme.textTheme.subtitle1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 300,
          child: Stack(
            children: [
              Positioned.fill(
                // In order to have the ink splash appear above the image, you
                // must use Ink.image. This allows the image to be painted as
                // part of the Material and display ink effects above it. Using
                // a standard Image will obscure the ink splash.
                child: MedicamentoFoto(fotos: medicamento.fotos!),
              ),
            ],
          ),
        ),
        // Description and share/explore buttons.
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 16, 8, 0),
          child: DefaultTextStyle(
            softWrap: false,
            overflow: TextOverflow.ellipsis,
            style: descriptionStyle!,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // This array contains the three line description on each card
                // demo.
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    medicamento.nombre!,
                    style: descriptionStyle.copyWith(color: Colors.black54),
                  ),
                ),
                Text(medicamento.labtitular!),
              ],
            ),
          ),
        ),
        // share, explore buttons
        ButtonBar(
          alignment: MainAxisAlignment.start,
          children: [
            TextButton(
              onPressed: () {
                debugPrint('pressed');
              },
              child: const Text('Abrir'),
            ),
            TextButton(
              onPressed: () {
                debugPrint('pressed');
              },
              child: const Text('Compartir'),
            ),
          ],
        ),
      ],
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 4, 4, 12),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(title, style: Theme.of(context).textTheme.subtitle1),
      ),
    );
  }
}
