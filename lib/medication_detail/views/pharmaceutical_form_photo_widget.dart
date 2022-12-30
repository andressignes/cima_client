import 'package:cima_client/common/widgets/widgets.dart';
import 'package:flutter/material.dart';

class PharmaceuticalFormPhotoWidget extends StatelessWidget {
  const PharmaceuticalFormPhotoWidget({
    super.key,
    required this.photo,
  });

  final Uri? photo;

  @override
  Widget build(BuildContext context) {
    if (photo == null) {
      return Image.asset('assets/images/no_image.png');
    }
    return InkWell(
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
          photo.toString(),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
