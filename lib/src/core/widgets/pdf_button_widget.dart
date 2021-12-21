import 'dart:developer';
import 'dart:io' show Platform;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PdfButtonWidget extends StatelessWidget {
  const PdfButtonWidget({
    Key? key,
    required this.title,
    required this.url,
  }) : super(key: key);

  final String title;
  final String? url;

  @override
  Widget build(BuildContext context) {
    if (url == null) {
      return Container();
    }
    return ElevatedButton(
      onPressed: () => _openBrowser(url),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            const Icon(Icons.picture_as_pdf),
            Text(title),
          ],
        ),
      ),
    );
  }

  void _openBrowser(String? url) async {
    if (url == null) return;
    if (kIsWeb) {
      await launch(
        url,
        forceSafariVC: false,
      );
      return;
    }
    if (await canLaunch(url)) {
      if (Platform.isAndroid) {
        await launch(url);
      } else if (Platform.isIOS) {
        if (!await launch(
          url,
          forceSafariVC: false,
          universalLinksOnly: true,
        )) {
          await launch(url, forceSafariVC: true);
        }
      } else {
        await launch(
          url,
          forceSafariVC: false,
        );
      }
    } else {
      log('Could not launch $url');
    }
  }
}
