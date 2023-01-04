import 'package:cima_client/common/widgets/pdf_button_widget.dart';
import 'package:cima_client/l10n/l10n.dart';
import 'package:cima_model/cima_model.dart';
import 'package:flutter/material.dart';

class ButtonRowWidget extends StatelessWidget {
  const ButtonRowWidget({super.key, required this.medicamento});

  final Medication medicamento;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          PdfButtonWidget(
            title: l10n.technical_profile,
            url: medicamento.getDocument(DocumentType.fichaTecnica)?.url,
          ),
          PdfButtonWidget(
            title: l10n.prospect,
            url: medicamento.getDocument(DocumentType.prospecto)?.url,
          ),
        ],
      ),
    );
  }
}
