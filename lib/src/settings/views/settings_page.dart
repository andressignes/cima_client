import 'dart:developer';
import 'dart:io';

import 'package:cima_client/src/localization/l10n.dart';
import 'package:cima_client/src/theme/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settings_title),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ThemeSelectorWidget(),
              const Spacer(),
              TextButton(
                onPressed: () =>
                    _openBrowser('https://github.com/asignes86/cima_client'),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/github.png',
                      width: 32,
                    ),
                    const SizedBox(width: 8),
                    Text(l10n.github_button_text),
                  ],
                ),
              ),
              TextButton(
                onPressed: () => _openBrowser('https://cima.aemps.es/'),
                child: Row(
                  children: [
                    Image.asset('assets/images/cima.png', width: 32),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        l10n.cima_button_text,
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () => _openAboutDialog(context),
                  child: Text(l10n.about_button_text)),
              const SizedBox(height: 32),
              Text(l10n.made_with_love_by),
            ],
          ),
        ),
      ),
    );
  }

  void _openAboutDialog(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationIcon: const Icon(Icons.local_hospital),
      applicationVersion: '1.0.0',
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
