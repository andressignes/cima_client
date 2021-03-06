import 'package:cima_client/src/core/widgets/image_fullscreen_page.dart';
import 'package:cima_model/cima_model.dart' show Foto;
import 'package:flutter/material.dart';

class MedicationPhotoWidget extends StatelessWidget {
  const MedicationPhotoWidget({
    Key? key,
    required this.fotos,
  }) : super(key: key);
  final List<Foto>? fotos;
  final _type = 'materialas';

  @override
  Widget build(BuildContext context) {
    if (fotos == null || fotos!.isEmpty) {
      return Image.asset('assets/images/no_image.png');
    }
    final urlPhoto = fotos!.firstWhere((foto) => foto.tipo == _type).url ?? '';

    return SizedBox(
      height: 150,
      width: double.infinity,
      child: fotos?.isEmpty ?? true
          ? Image.asset('assets/images/no_image.png')
          : InkWell(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ImageFullscreenPage(
                    imageLink: urlPhoto,
                  ),
                ),
              ),
              child: Hero(
                tag: urlPhoto,
                child: Image.network(urlPhoto.replaceAll('thumbnails', 'full'),
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                  return loadingProgress == null
                      ? child
                      : const Center(child: CircularProgressIndicator());
                }),
              ),
            ),
    );
  }
}
