import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DarkSkeletonListItemHorizontal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade800, // Darker color for the shimmer
      highlightColor: Colors.grey.shade600, // Highlight color for the shimmer
      child: Container(
        width: 170.0,
        margin: const EdgeInsets.symmetric(horizontal: 0.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Stack(
            children: [
              // Shimmering Skeleton loading image
              SizedBox(
                height: 90.0,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: const Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Container(
                    color:
                        Colors.white, // Use a white color for the shimmer image
                  ),
                ),
              ),
              // Shimmering Skeleton loading text content
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 14.0,
                      color: Colors
                          .white, // Use a white color for the shimmer text
                    ),
                    const SizedBox(height: 2.0),
                    Container(
                      width: double.infinity,
                      height: 14.0,
                      color: Colors
                          .white, // Use a white color for the shimmer text
                    ),
                    const SizedBox(height: 2.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 60.0,
                          height: 14.0,
                          color: Colors
                              .white, // Use a white color for the shimmer text
                        ),
                        Container(
                          width: 60.0,
                          height: 14.0,
                          color: Colors
                              .white, // Use a white color for the shimmer text
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Shimmering Skeleton loading tag
            ],
          ),
        ),
      ),
    );
  }
}
