import 'package:flutter/cupertino.dart';
import 'package:news_mobile_app/ui/widgets/loader/loader_widget.dart';
import 'package:news_mobile_app/utils/responsive_config/responsive_config.dart';

Widget pageLoaderWidget(BuildContext context, bool isLoader) {
  return isLoader
      ? Container(
          padding: EdgeInsets.only(bottom: context.heightPx * 15, top: context.heightPx * 15),
          alignment: Alignment.center,
          child: const LoaderWidget(),
        )
      : SizedBox(
          height: context.heightPx * 10,
        );
}
