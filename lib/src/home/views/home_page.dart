import 'package:cima_client/src/authorized/views/last_authorized_page.dart';
import 'package:cima_client/src/problemas_suministro/views/problemas_suministro_page.dart';
import 'package:cima_client/src/search/views/serch_page.dart';
import 'package:cima_client/src/settings/settings_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('⚕️ Last Medication Authorized'),
        actions: [
          IconButton(
            icon: const Icon(Icons.report_problem),
            onPressed: () {
              Navigator.restorablePushNamed(
                  context, ProblemasSuministroPage.routeName);
            },
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.restorablePushNamed(context, SearchPage.routeName);
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),
      body: const LastAuthorizedPage(),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     context.read<AuthorizedBloc>().add(const GetAuthorized());
      //   },
      //   child: const Icon(Icons.search),
      // ),
    );
  }
}
