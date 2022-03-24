import 'package:flutter/cupertino.dart';
import 'package:news_mobile_app/utils/responsive_config/responsive_config.dart';

import '../../../utils/text_style/text_style.dart';

class HighLightTextWidget extends StatelessWidget {
  const HighLightTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.widthPx * 25.0, vertical: context.heightPx * 10),
      child: Text(
        "Highlights",
        textAlign: TextAlign.start,
        style: TextFontStyle.semiBold(size: context.textPx * 20),
      ),
    );
  }
}
