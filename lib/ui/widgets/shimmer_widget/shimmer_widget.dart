import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/color/colors.dart';


class ShimmerWidget extends StatelessWidget {
  final Color baseColor;
  final Color highlightColor;
  final double height;
  final double width;
  final double radius;
  const ShimmerWidget(
      {Key? key,
      this.baseColor = AppColor.gridColor,
      this.highlightColor = AppColor.whiteColor,
      this.height = 500,
      this.width = 500,
      this.radius = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(color: baseColor, borderRadius: BorderRadius.circular(radius)),
      ),
    );
  }
}
