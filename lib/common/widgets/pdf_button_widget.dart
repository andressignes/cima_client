import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PdfButtonWidget extends StatelessWidget {
  const PdfButtonWidget({
    super.key,
    required this.title,
    required this.url,
  });

  final String title;
  final Uri? url;

  @override
  Widget build(BuildContext context) {
    if (url == null) {
      return Container();
    }
    return ElevatedButton(
      onPressed: url == null ? null : () => _openBrowser(url!),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Column(
          children: [
            const Icon(Icons.picture_as_pdf),
            Text(title),
          ],
        ),
      ),
    );
  }

  Future<void> _openBrowser(Uri url) async {
    await launchUrl(url);
  }
}
