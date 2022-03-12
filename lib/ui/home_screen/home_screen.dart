import 'package:flutter/material.dart';
import 'package:news_mobile_app/services/navigator/routes.dart';
import 'package:news_mobile_app/utils/color/colors.dart';
import 'package:news_mobile_app/utils/navigation/navigation.dart';
import 'package:news_mobile_app/utils/responsive_config/responsive_config.dart';

import '../../utils/text_style/text_style.dart';
import '../../widgets/app_bar_widget/app_bar_widget.dart';
import '../../widgets/popup_widget/popup_widget.dart';
import '../menu_screen/menu_screen.dart';
import 'home_page_widget/category_widget.dart';
import 'home_page_widget/news_list_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuScreen(),
      appBar: AppBarWidget(
        menuPress: () {
          Scaffold.of(context).openDrawer();
        },
        filterPress: () {
          showDialog(context: context, builder: (BuildContext context) => const PopUpWidget());
        },
        notificationPress: () {
          context.pushNamed(ScreenNames.notificationScreen);
        },
        appBar: AppBar(),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 8,
                    child: Container(
                      // height: MediaQuery.of(context).size.height * 0.10,
                      margin: EdgeInsets.symmetric(horizontal: context.widthPx * 25.0, vertical: context.heightPx * 20),
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                            color: AppColor.hintColor,
                          )),
                      child: TextFormField(
                        // controller: controller,
                        style: TextFontStyle.med(color: AppColor.fontColor, size: context.textPx * 16),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search',
                          hintStyle: TextFontStyle.regular(color: AppColor.hintColor, size: context.textPx * 16),
                          filled: true,
                          fillColor: AppColor.whiteColor,
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(horizontal: context.widthPx * 10.0),
                            child: InkWell(
                              onTap: () {},
                              child: const Icon(
                                Icons.search,
                                color: AppColor.hintColor,
                              ),
                            ),
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(vertical: context.heightPx * 12, horizontal: context.widthPx * 20),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const CategoryWidget(),
              const NewsListWidget()
            ],
          ),
        ),
      ),
    );
  }
}
