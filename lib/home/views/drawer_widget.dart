import 'package:cima_client/app/router/routes.dart';
import 'package:cima_client/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

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
              child: Image.asset('assets/images/cima.png'),
            ),
          ),
          ListTile(
            title: Text(l10n.supplier_problems_title),
            leading: const Icon(Icons.warning),
            onTap: () => context
              ..pop()
              ..pushNamed(Routes.supplyProblems.name),
          ),
          ListTile(
            title: Text(l10n.recently_authorized_title),
            leading: const Icon(Icons.history),
            onTap: () => context
              ..pop()
              ..pushNamed(Routes.lastAuthorized.name),
          ),
          ListTile(
            title: Text(l10n.settings_title),
            onTap: () => context
              ..pop()
              ..pushNamed(Routes.settings.name),
            leading: const Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}
