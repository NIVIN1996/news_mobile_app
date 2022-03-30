import 'package:flutter/material.dart';
import 'package:news_mobile_app/ui/navigation/routes.dart';
import 'package:news_mobile_app/ui/navigation/navigation.dart';
import 'package:news_mobile_app/utils/responsive_config/responsive_config.dart';

import '../../models/language_model/language_model.dart';
import '../../utils/color/colors.dart';
import '../../utils/text_style/text_style.dart';


class ChooseLanguageScreen extends StatefulWidget {
  const ChooseLanguageScreen({Key? key}) : super(key: key);

  @override
  _ChooseLanguageScreenState createState() => _ChooseLanguageScreenState();
}

class _ChooseLanguageScreenState extends State<ChooseLanguageScreen> {
  int _value2 = 0;
  final List<GroupModel> _group = [
    GroupModel(text: "English", index: 1, selected: true),
    GroupModel(text: "Malayalam", index: 2, selected: false),
    GroupModel(text: "Tamil", index: 3, selected: false),
    GroupModel(text: "Hindi", index: 4, selected: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: context.percentHeight * 40,
          width: double.infinity,
          margin: EdgeInsets.all(context.widthPx * 20.0),
          decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              boxShadow: const [BoxShadow(blurRadius: 3.0)],
              borderRadius: BorderRadius.circular(context.widthPx * 10),
              border: Border.all(color: AppColor.hintColor)),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: context.heightPx * 10.0),
                child: Text(
                  'Choose Language',
                  textAlign: TextAlign.center,
                  style: TextFontStyle.med(size: context.textPx * 20),
                ),
              ),
              const Divider(
                color: AppColor.grey3,
                thickness: 0.5,
              ),
              Column(
                children: <Widget>[makeRadioTileList()],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.heightPx * 25.0, vertical: context.heightPx * 20),
        child: GestureDetector(
          onTap: () {
            // context.pushNamed(ScreenNames.login);
            context.pushNamedAndRemoveUntil(ScreenNames.login);
          },
          child: Text(
            'Next',
            textAlign: TextAlign.right,
            style: TextFontStyle.med(size: context.textPx * 20),
          ),
        ),
      ),
    );
  }

  Widget makeRadioTileList() {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < _group.length; i++) {
      list.add(RadioListTile(
        value: _group[i].index,
        groupValue: _value2,
        title: Text(
          ' ${_group[i].text}',
          style: TextFontStyle.med(
              color: _group[i].selected ? AppColor.yellow : AppColor.grey3, size: context.textPx * 20),
        ),
        selected: _group[i].selected,
        onChanged: (int? val) {
          setState(() {
            for (int i = 0; i < _group.length; i++) {
              _group[i].selected = false;
            }
            _value2 = val!;
            _group[i].selected = true;
          });
        },
        activeColor: AppColor.yellow,
        controlAffinity: ListTileControlAffinity.leading,
      ));
    }

    Column column = Column(
      children: list,
    );
    return column;
  }
}
