// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_shop/resources/constant/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageSlider extends StatelessWidget {
  final List<dynamic> images;
  double? aspectRatio;
  double? borderRadius;
  bool? isNetworkImage;
  ImageSlider({
    super.key,
    required this.images,
    this.aspectRatio,
    this.borderRadius,
    this.isNetworkImage,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: images.length,
      itemBuilder: (BuildContext context, int index, int pageViewIndex) =>
          ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius ?? 12),
        child: isNetworkImage ?? false
            ? CachedNetworkImage(
                width: double.maxFinite,
                fit: BoxFit.fill,
                imageUrl: images[index],
                placeholder: (context, url) => Skeletonizer(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      AppAssets.ad1,
                      fit: BoxFit.fill,
                      height: aspectRatio,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              )
            : Image.asset(
                images[index],
                fit: BoxFit.fill,
              ),
      ),
      options: CarouselOptions(
        aspectRatio: aspectRatio ?? 20 / 9,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
        autoPlay: true,
        viewportFraction: 0.9,
      ),
    );
  }
}
