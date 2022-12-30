import 'package:cima_client/common/widgets/widgets.dart';
import 'package:flutter/material.dart';

class MedicationPhotoWidget extends StatelessWidget {
  const MedicationPhotoWidget({
    super.key,
    required this.photo,
  });

  final Uri? photo;

  @override
  Widget build(BuildContext context) {
    if (photo == null) {
      return Image.asset('assets/images/no_image.png');
    }

    return SizedBox(
      height: 150,
      width: double.infinity,
      child: photo == null
          ? Image.asset('assets/images/no_image.png')
          : InkWell(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (context) => ImageFullscreenPage(
                    imageLink: photo.toString(),
                  ),
                ),
              ),
              child: Hero(
                tag: photo.toString(),
                child: Image.network(
                  photo.toString().replaceAll('thumbnails', 'full'),
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    return loadingProgress == null
                        ? child
                        : Image.network(photo.toString(), fit: BoxFit.cover);
                  },
                ),
              ),
            ),
    );
  }
}
