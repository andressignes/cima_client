import 'package:cima_client/common/functions.dart';
import 'package:cima_client/l10n/l10n.dart';
import 'package:cima_client/settings/widgets/theme_selector_widget.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  static Page<void> get page => const MaterialPage(child: SettingsPage());

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settings_title),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'about',
                child: ListTile(
                  leading: const Icon(Icons.info_outline),
                  title: Text(l10n.about),
                ),
              ),
            ],
            onSelected: (value) {
              if (value == 'about') {
                showAboutDialogApp(context: context);
              }
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const _AppearanceSectionView(),
              Row(
                children: [
                  Text(
                    l10n.theme,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(width: 8),
                  const ThemeSelectorWidget()
                ],
              ),
              const Spacer(),
              Text(l10n.made_with_love_by),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> showAboutDialogApp({required BuildContext context}) async {
    final packageInfo = await PackageInfo.fromPlatform();
    final l10n = context.l10n;
    const repoLink = 'https://github.com/asignes86/cima_client';
    const cimaLink = 'https://cima.aemps.es/';

    showAboutDialog(
      context: context,
      applicationName: packageInfo.appName,
      applicationVersion: packageInfo.version,
      // applicationIcon: Image.asset('assets/images/logo.png'),
      applicationLegalese: '© 2021 - 2021, CIMA',
      children: [
        TextButton(
          onPressed: () => openLink(repoLink),
          child: Text(l10n.github_button_text),
        ),
        TextButton(
          onPressed: () => openLink(cimaLink),
          child: Text(l10n.cima_button_text),
        ),
      ],
    );
  }
}
