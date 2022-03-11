import 'package:flutter/material.dart';
import 'package:news_mobile_app/utils/responsive_config/responsive_config.dart';
import '../../utils/text_style/text_style.dart';
import '../../widgets/app_bar_widget/common_app_bar_widget.dart';

class TermsAndConditionScreen extends StatefulWidget {
  const TermsAndConditionScreen({Key? key}) : super(key: key);

  @override
  _TermsAndConditionScreenState createState() => _TermsAndConditionScreenState();
}

class _TermsAndConditionScreenState extends State<TermsAndConditionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBarWidget(
        showFilter: false,
        showNotification: false,
        backPress: () {
          Navigator.pop(context);
        },
        notificationPress: () {},
        appBar: AppBar(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.widthPx * 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.only(top:context.heightPx* 8.0),
                child: Text(
                  "Terms and Conditions",
                  textAlign: TextAlign.start,
                  style: TextFontStyle.med(size: context.textPx * 25),
                ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(vertical:context.heightPx* 10.0),
                child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                  textAlign: TextAlign.justify,
                  style: TextFontStyle.regular(size: context.textPx * 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
