import '/app/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class DetailScreen extends StatelessWidget {
  final int id;

  const DetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final bottomSheetShape = Theme.of(context).bottomSheetTheme.shape;
    BorderRadius borderRadius = BorderRadius.zero;

    if (bottomSheetShape is RoundedRectangleBorder && bottomSheetShape.borderRadius is BorderRadius) {
      borderRadius = bottomSheetShape.borderRadius as BorderRadius;
    }

    debugPrint('DetailScreen built with id: $id');
    debugPrint('BorderRadius: $borderRadius');

    return ClipRRect(
      borderRadius: BorderRadiusGeometry.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(child: SvgPicture.asset(AppAssets.bg, fit: BoxFit.cover)),

          Text('Welcome to the Detail Screen ${id.toString()}'),
          Positioned(
            top: 8,
            right: 8,
            child: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                context.pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
