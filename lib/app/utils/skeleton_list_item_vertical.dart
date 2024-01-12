import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DarkSkeletonListItemVertical extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(11.0),
      child: Container(
        width: double.infinity, // Set a width to provide constraints
        height: 100.0, // Set a height to provide constraints
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade800, // Dark gray color for the shimmer
          highlightColor:
              Colors.grey.shade600, // Highlight color for the shimmer
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 90.0,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      child: Container(
                        color: Colors.grey[
                            700], // Use dark gray color for the shimmer image
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 14.0,
                              color: Colors.grey[
                                  700], // Use dark gray color for the shimmer text
                            ),
                            const SizedBox(height: 2.0),
                            Container(
                              width: double.infinity,
                              height: 14.0,
                              color: Colors.grey[
                                  700], // Use dark gray color for the shimmer text
                            ),
                            const SizedBox(height: 2.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 80.0,
                                      height: 14.0,
                                      color: Colors.grey[
                                          700], // Use dark gray color for the shimmer text
                                    ),
                                  ],
                                ),
                                Container(
                                  width: 80.0,
                                  height: 14.0,
                                  color: Colors.grey[
                                      700], // Use dark gray color for the shimmer text
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
