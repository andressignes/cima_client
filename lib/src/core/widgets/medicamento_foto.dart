import 'package:cima_model/cima_model.dart';
import 'package:flutter/material.dart';

class MedicamentoFoto extends StatelessWidget {
  final List<Foto> fotos;
  final String? urlFoto;

  MedicamentoFoto({Key? key, required this.fotos})
      : urlFoto = fotos
            .where((element) => element.tipo == 'materialas')
            .first
            .url!
            .replaceAll('thumbnails', 'full'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return (urlFoto != null)
        ? Ink.image(
            image: NetworkImage(urlFoto!),
            fit: BoxFit.fitHeight,
            child: Container())
        : Ink.image(
            image: const AssetImage('assets/images/no_image.png'),
            fit: BoxFit.fitHeight,
            child: Container());
  }
}
