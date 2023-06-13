import 'dart:developer';

import 'package:cima_client/app/router/routes.dart';
import 'package:cima_client/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:go_router/go_router.dart';

class ScanFabWidget extends StatefulWidget {
  const ScanFabWidget({super.key});

  @override
  State<ScanFabWidget> createState() => _ScanFabWidgetState();
}

class _ScanFabWidgetState extends State<ScanFabWidget> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return FloatingActionButton(
      heroTag: 'scan',
      onPressed: () async {
        final lineColor =
            Theme.of(context).colorScheme.primary.value.toRadixString(16);
        late final String barcodeScanRes;
        try {
          barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            '#$lineColor',
            l10n.cancel,
            false,
            ScanMode.DEFAULT,
          );
        } on PlatformException catch (e) {
          barcodeScanRes = '';
          log(e.toString());
        }
        if (!mounted) return;
        if (barcodeScanRes.isEmpty || barcodeScanRes.length < 12) {
          return;
        }
        log('Barcode: $barcodeScanRes');
        final nationalCode = barcodeScanRes.substring(6, 12);
        log('cn: $nationalCode');
        await context.pushNamed(
          Routes.medicationDetail.name,
          queryParameters: {
            'cn': nationalCode,
          },
        );
      },
      child: const Icon(Icons.qr_code_scanner),
    );
  }
}
