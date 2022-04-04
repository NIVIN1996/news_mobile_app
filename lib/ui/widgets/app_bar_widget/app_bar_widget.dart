import 'package:flutter/material.dart';
import 'package:news_mobile_app/ui/navigation/routes.dart';
import 'package:news_mobile_app/ui/navigation/navigation.dart';
import 'package:news_mobile_app/utils/responsive_config/responsive_config.dart';

import '../../../utils/text_style/text_style.dart';
import 'appbar_size/appbar_size.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool showFilter;
  final String label;
  final AppBar appBar;
  final void Function()? menuPress;
  final void Function()? filterPress;
  final void Function()? notificationPress;

  const AppBarWidget({
    Key? key,
    required this.appBar,
    this.menuPress,
    this.notificationPress,
    this.showFilter = true,
    this.label = "News4U",
    this.filterPress,
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
          "News4U",
          style: TextFontStyle.med(size: context.textPx * 24),
        ),
      ),
      //! leading padding
      leading: Builder(builder: (context) {
        return GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
            Scaffold.of(context).openDrawer();
          },
          child: Container(padding: AppBarSize.leadingPadding(context), child: AppBarSize.menuIconWidget(context)),
        );
      }),
      actions: [

        Padding(
          //! trailing padding
          padding: AppBarSize.tailingPadding(context),
          child: GestureDetector(
            onTap: notificationPress ??
                () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  context.pushNamed(ScreenNames.notificationScreen);
                },
            //! Search icon widget
            child: Container(child: AppBarSize.notificationIconWidget(context)),
          ),
        ),
      ],
      centerTitle: true,
    );
  }
}
