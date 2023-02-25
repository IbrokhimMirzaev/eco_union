import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ResizableShimmerItem extends StatelessWidget {
  const ResizableShimmerItem({
    super.key,
    this.width = 0,
    this.height = 0,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.green.withOpacity(0.1),
      highlightColor: Colors.green.withOpacity(0.2),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: Colors.white,
        ),
      ),
    );
  }

  final double? width;
  final double? height;
  final BorderRadius borderRadius;
}
