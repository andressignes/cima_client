import 'package:flutter/material.dart';

class PhotoItemList extends StatelessWidget {
  const PhotoItemList({
    super.key,
    required this.photo,
  });

  final Uri? photo;

  @override
  Widget build(BuildContext context) {
    if (photo == null) {
      return Image.asset('assets/images/no_image.png');
    }

    return Hero(
      tag: photo!.toString(),
      child: Image.network(
        photo!.toString(),
        loadingBuilder: (context, child, loadingProgress) =>
            loadingProgress == null
                ? child
                : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
