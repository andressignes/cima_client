import 'dart:developer';
import 'dart:io';

import 'package:cima_client/src/home/views/drawer_widget.dart';
import 'package:cima_client/src/localization/l10n.dart';
import 'package:cima_client/src/search/search.dart';
import 'package:cima_client/src/settings/settings.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
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
            const Spacer(),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.restorablePushNamed(context, SearchPage.routeName),
        child: const Icon(Icons.search),
      ),
    );
  }

  void _openLink(String url) async {
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
