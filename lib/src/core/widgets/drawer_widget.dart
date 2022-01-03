import 'package:cima_client/src/authorized/views/last_authorized_page.dart';
import 'package:cima_client/src/search/views/serch_page.dart';
import 'package:cima_client/src/settings/views/settings_page.dart';
import 'package:cima_client/src/supply_problems/supply_problems.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Center(
              child: Image.asset(
                'assets/images/cima.png',
              ),
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
            ),
          ),
          ListTile(
            title: const Text('Problemas de suministro'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.restorablePushNamed(
                  context, SupplyProblemsPage.routeName);
            },
          ),
          ListTile(
            title: const Text('Autorizados Recientemente'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.restorablePushNamed(
                  context, LastAuthorizedPage.routeName);
            },
          ),
          ListTile(
            title: const Text('Buscar'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.restorablePushNamed(context, SearchPage.routeName);
            },
          ),
          ListTile(
            title: const Text('Ajustes'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.restorablePushNamed(context, SettingsPage.routeName);
            },
          ),
        ],
      ),
    );
  }
}
