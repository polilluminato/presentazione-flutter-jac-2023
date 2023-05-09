import 'package:flutter/material.dart';
import 'package:flutter_jac/models/photo.dart';

class GalleryCard extends StatelessWidget {
  const GalleryCard({super.key, required this.photo});

  final Photo photo;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(photo.src!.medium!),
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
            child: Text(
              "${photo.alt}",
              style: textTheme.labelMedium,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "${photo.photographer}",
              style: textTheme.labelSmall,
            ),
          ),
        ],
      ),
    );
  }
}
