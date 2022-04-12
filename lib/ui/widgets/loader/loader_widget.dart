import 'package:flutter/material.dart';

import '../../../utils/color/colors.dart';

class LoaderWidget extends StatelessWidget {
  final double radius;
  const LoaderWidget({Key? key, this.radius = 30}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: radius,
        height: radius,
        child: const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppColor.whiteColor),
          strokeWidth: 3,
          backgroundColor: AppColor.yellow2,
        ),
      ),
    );
  }
}
