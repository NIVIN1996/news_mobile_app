import 'package:flutter/material.dart';
import 'package:news_mobile_app/ui/navigation/navigation.dart';
import 'package:news_mobile_app/utils/responsive_config/responsive_config.dart';

import '../../../utils/text_style/text_style.dart';
import '../../navigation/routes.dart';
import 'appbar_size/appbar_size.dart';

class CommonAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool showNotification;
  final String label;
  final AppBar appBar;
  final void Function()? backPress;
  final void Function()? notificationPress;

  const CommonAppBarWidget({
    Key? key,
    required this.appBar,
    this.backPress,
    this.notificationPress,
    this.showNotification = true,
    this.label = "",
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(AppBarSize.appBarHeight(appBar));

  @override
  Widget build(BuildContext context) {
    return AppBar(
      //! toolbar height
      elevation: 0,
      title: Center(
        child: Text(
          label,
          style: TextFontStyle.med(size: context.textPx * 24),
        ),
      ),
      //! leading padding
      leading: Builder(builder: (context) {
        return GestureDetector(
          onTap: backPress,
          child: Container(padding: AppBarSize.leadingPadding(context), child: AppBarSize.backIconWidget(context)),
        );
      }),
      actions: [
        showNotification == true
            ? Padding(
                //! trailing padding
                padding: AppBarSize.tailingPadding(context),
                child: GestureDetector(
                  onTap: () {
                    context.pushNamed(ScreenNames.notificationScreen);
                  },
                  //! Search icon widget
                  child: Container(child: AppBarSize.notificationIconWidget(context)),
                ),
              )
            : Padding(
                padding: AppBarSize.emptyTailingPadding(context),
                child: const SizedBox(),
              ),
      ],
      centerTitle: true,
    );
  }
}
