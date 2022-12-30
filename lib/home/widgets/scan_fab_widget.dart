import 'dart:developer';

import 'package:cima_client/l10n/l10n.dart';
import 'package:cima_client/medication_detail/medication_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanFabWidget extends StatelessWidget {
  const ScanFabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return FloatingActionButton(
      heroTag: 'scan',
      onPressed: () async {
        final lineColor =
            Theme.of(context).colorScheme.primary.value.toRadixString(16);
        final barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#$lineColor',
          l10n.cancel,
          false,
          ScanMode.DEFAULT,
        );
        if (barcodeScanRes.isEmpty || barcodeScanRes.length < 12) {
          return;
        }
        log('Barcode: $barcodeScanRes');
        final nationalCode = barcodeScanRes.substring(6, 12);
        log('cn: $nationalCode');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MedicationDetailPage(
              cn: nationalCode,
            ),
          ),
        );
      },
      child: const Icon(Icons.qr_code_scanner),
    );
  }
}
