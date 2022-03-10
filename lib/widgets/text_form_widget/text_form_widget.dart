import 'package:flutter/material.dart';
import 'package:news_mobile_app/utils/responsive_config/responsive_config.dart';

import '../../utils/color/colors.dart';
import '../../utils/text_style/text_style.dart';

class TextFormWidget extends StatefulWidget {
  final String? labelText;

  final TextEditingController controller;
  final EdgeInsets? contentPadding;
  final bool edit;

  final TextInputType? keyboardType;
  final bool obscureText;
  final Function(String)? onChange;
  final int maxLength;
  final int line;
  final EdgeInsets? padding;

  final Function? onTap;
  final bool showEyeIcon;
  final Color iconColor;
  final String? validationText;
  const TextFormWidget({
    this.labelText,
    required this.controller,
    this.contentPadding,
    this.keyboardType,
    this.edit = true,
    this.obscureText = false,
    this.onChange,
    this.maxLength = 100,
    this.padding,
    this.line = 1,
    this.onTap,
    this.iconColor = Colors.grey,
    this.showEyeIcon = false,
    this.validationText,
    Key? key,
  }) : super(key: key);

  @override
  State<TextFormWidget> createState() => _TextFormWidgetState();
}

class _TextFormWidgetState extends State<TextFormWidget> {
  late bool showText;
  @override
  void initState() {
    if (widget.showEyeIcon) {
      showText = true;
    } else {
      showText = widget.obscureText;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? EdgeInsets.symmetric(vertical: context.heightPx * 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: widget.controller,
            maxLines: widget.line,
            enabled: widget.edit,
            keyboardType: widget.keyboardType,
            obscureText: showText,
            maxLength: widget.maxLength,
            onChanged: widget.onChange,
            onTap: () {
              if (widget.onTap != null) {
                widget.onTap!();
              }
            },
            decoration: InputDecoration(
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: AppColor.hintColor, width: 2)),
                suffixIcon: (widget.showEyeIcon)
                    ? IconButton(
                        splashColor: Colors.transparent,
                        splashRadius: 1,
                        onPressed: () {
                          setState(() {
                            showText = !showText;
                          });
                        },
                        icon: showText
                            ? const Icon(Icons.visibility_off)
                            : const Icon(
                                Icons.visibility,
                              ),
                        color: widget.iconColor,
                      )
                    : null,
                filled: true,
                fillColor: AppColor.whiteColor,
                counterText: "",
                hintText: widget.labelText,
                hintStyle: const TextStyle(color: AppColor.grey2),
                contentPadding: widget.contentPadding ??
                    EdgeInsets.symmetric(
                        vertical: context.heightPx * context.screenWidth > 600 ? 25 : 25,
                        horizontal: context.widthPx * context.screenWidth > 600 ? 18 : 15)),
            style: TextFontStyle.med(color: AppColor.fontColor, size: context.textPx * 16),
            textAlignVertical: widget.showEyeIcon ? TextAlignVertical.center : null,
          ),
          if (widget.validationText != null)
            Text(
              widget.validationText!,
              style: TextFontStyle.regular(size: context.textPx * 12, color: AppColor.red),
            )
        ],
      ),
    );
  }
}
