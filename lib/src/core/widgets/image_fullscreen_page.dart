import 'package:flutter/material.dart';

class ImageFullscreenPage extends StatelessWidget {
  const ImageFullscreenPage({
    Key? key,
    required String imageLink,
  })  : _imageLink = imageLink,
        super(key: key);

  final String _imageLink;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: _imageLink,
        child: Image.network(
          _imageLink.replaceAll('thumbnails', 'full'),
          fit: BoxFit.contain,
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
