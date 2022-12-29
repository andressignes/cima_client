import 'dart:developer';

import 'package:cima_client/src/home/views/drawer_widget.dart';
import 'package:cima_client/src/localization/l10n.dart';
import 'package:cima_client/src/medication_detail/medication_detail.dart';
import 'package:cima_client/src/search/search.dart';
import 'package:cima_client/src/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.home_page_title),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, SettingsPage.routeName);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              l10n.home_page_paragraph1,
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              l10n.home_page_paragraph2,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            const SizedBox(height: 16),
            Text(
              l10n.home_page_paragraph3,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () => _openLink('https://www.aemps.gob.es/'),
                    child: Image.asset('assets/images/web.png'),
                  ),
                  TextButton(
                    onPressed: () => _openLink('https://twitter.com/AEMPSGOB'),
                    child: Image.asset('assets/images/twitter.png'),
                  ),
                  TextButton(
                    onPressed: () =>
                        _openLink('https://www.youtube.com/AempsGobEsinfo'),
                    child: Image.asset('assets/images/youtube.png'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      drawer: const DrawerWidget(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'search',
            onPressed: () =>
                Navigator.restorablePushNamed(context, SearchPage.routeName),
            child: const Icon(Icons.search),
          ),
          const SizedBox(width: 16),
          FloatingActionButton(
            heroTag: 'scan',
            onPressed: () async {
              String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
                '#${Theme.of(context).colorScheme.primary.value.toRadixString(16)}',
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
                          )));
            },
            child: const Icon(Icons.qr_code_scanner),
          ),
        ],
      ),
    );
  }

  void _openLink(String url) async {
    await launchUrl(Uri.parse(url));
  }
}
