import 'package:flutter/material.dart';

class PhotoItemList extends StatelessWidget {
  const PhotoItemList({
    required this.photo,
    super.key,
  });

  final Uri? photo;

  @override
  Widget build(BuildContext context) {
    if (photo == null) {
      return Image.asset('assets/images/no_image.png');
    }

    return Hero(
      tag: photo!.toString(),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(8),
          topLeft: Radius.circular(8),
        ),
        child: Image.network(
          photo!.toString(),
          fit: BoxFit.fill,
          loadingBuilder: (context, child, loadingProgress) =>
              loadingProgress == null
                  ? child
                  : const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
