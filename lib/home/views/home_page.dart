import 'package:cima_client/home/home.dart';
import 'package:cima_client/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Page<void> page({Key? key}) => MaterialPage(child: HomePage(key: key));

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.home_page_title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
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
            const LinksRowWidget(),
          ],
        ),
      ),
      drawer: const DrawerWidget(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'search',
            onPressed: () => context.go('/search'),
            child: const Icon(Icons.search),
          ),
          const SizedBox(width: 16),
          const ScanFabWidget(),
        ],
      ),
    );
  }
}
