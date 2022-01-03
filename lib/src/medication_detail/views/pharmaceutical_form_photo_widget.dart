import 'package:cima_model/cima_model.dart' show Foto;
import 'package:flutter/material.dart';

class PharmaceuticalFormPhotoWidget extends StatelessWidget {
  const PharmaceuticalFormPhotoWidget({
    Key? key,
    required this.fotos,
  }) : super(key: key);

  final List<Foto>? fotos;
  final _type = 'formafarmac';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: fotos?.isEmpty ?? true
          ? Image.asset('assets/images/no_image.png')
          : Image.network(fotos!.firstWhere((foto) => foto.tipo == _type).url!,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
              return loadingProgress == null
                  ? child
                  : const Center(child: CircularProgressIndicator());
            }),
    );
  }
}
