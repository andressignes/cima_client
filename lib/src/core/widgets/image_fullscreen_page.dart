import 'package:flutter/material.dart';

class ImageFullscreenPage extends StatelessWidget {
  const ImageFullscreenPage({
    Key? key,
    required this.imageLink,
  }) : super(key: key);

  final String imageLink;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: imageLink,
        child: Image.network(
          imageLink,
          fit: BoxFit.contain,
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
