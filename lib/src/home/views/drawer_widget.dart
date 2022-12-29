import 'package:cima_client/src/authorized/views/last_authorized_page.dart';
import 'package:cima_client/src/localization/l10n.dart';
import 'package:cima_client/src/supply_problems/supply_problems.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
            ),
            child: Center(
              child: Image.asset(
                'assets/images/cima.png',
              ),
            ),
          ),
          ListTile(
            title: Text(l10n.supplier_problems_title),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.restorablePushNamed(
                  context, SupplyProblemsPage.routeName);
            },
          ),
          ListTile(
            title: Text(l10n.recently_authorized_title),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.restorablePushNamed(
                  context, LastAuthorizedPage.routeName);
            },
          ),
        ],
      ),
    );
  }
}
