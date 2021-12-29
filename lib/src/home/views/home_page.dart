import 'dart:developer';
import 'dart:io';

import 'package:cima_client/src/core/widgets/drawer_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('⚕️ CIMA Client'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Bienvenido al Centro de Información de Medicamentos de la AEMPS',
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              'Aqui podras consultar los medicamentos que tienen disponibles en el inventario, ver los ultimos medicamentos autorizados y los medicamentos que tienen algun tipo de problemas de suministro.',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            SizedBox(height: 16),
            Text(
              'Para mas informacion dirigete a la web de la AEMPS o ponte en contacto en alguna de sus redes sociales.',
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
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     context.read<AuthorizedBloc>().add(const GetAuthorized());
      //   },
      //   child: const Icon(Icons.search),
      // ),
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
