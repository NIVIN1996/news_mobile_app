import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../utils/color/colors.dart';

class SpinKitWidget extends StatelessWidget {
  const SpinKitWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SpinKitWave(
        color: AppColor.yellow2,
        size: 25,
        duration: Duration(seconds: 2),
        type: SpinKitWaveType.start);
  }
}
