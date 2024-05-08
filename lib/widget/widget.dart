import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper/models/photo_models.dart';

Widget walpaper(List<PhotoModel> listPhotos, BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
        padding: EdgeInsets.all(4.0),
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        mainAxisSpacing: 6.0,
        crossAxisSpacing: 6.0,
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: listPhotos.map((PhotoModel photoModel) {
          return GridTile(
              child: Hero(
                  tag: photoModel.src!.portrait!,
                  child: Container(
                    child: CachedNetworkImage(
                      imageUrl: photoModel.src!.portrait!,
                      fit: BoxFit.cover,
                    ),
                  )));
        }).toList()),
  );
}
