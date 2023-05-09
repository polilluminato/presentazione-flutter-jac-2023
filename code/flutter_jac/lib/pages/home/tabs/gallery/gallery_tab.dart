import 'package:flutter/material.dart';
import 'package:flutter_jac/models/photo.dart';
import 'package:flutter_jac/pages/home/tabs/gallery/ui/gallery_card.dart';
import 'package:flutter_jac/provider/AsyncValueWidget.dart';
import 'package:flutter_jac/provider/photo_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GalleryTab extends ConsumerWidget {
  const GalleryTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final photoList = ref.watch(photoListProvider);

    return AsyncValueWidget<List<Photo>?>(
      value: photoList,
      data: (data) {
        return MasonryGridView.count(
          crossAxisCount: 2,
          itemCount: data!.length,
          itemBuilder: (_, index) {
            return GalleryCard(
              photo: data[index],
            );
          },
        );
      },
    );
  }
}
