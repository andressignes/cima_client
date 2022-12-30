import 'package:cima_client/common/functions.dart';
import 'package:flutter/material.dart';

class LinksRowWidget extends StatelessWidget {
  const LinksRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: () => openLink('https://www.aemps.gob.es/'),
            child: Image.asset('assets/images/web.png'),
          ),
          TextButton(
            onPressed: () => openLink('https://twitter.com/AEMPSGOB'),
            child: Image.asset('assets/images/twitter.png'),
          ),
          TextButton(
            onPressed: () => openLink('https://www.youtube.com/AempsGobEsinfo'),
            child: Image.asset('assets/images/youtube.png'),
          ),
        ],
      ),
    );
  }
}
