import 'package:audacity_demo/config/app_color.dart';
import 'package:audacity_demo/widgets/text_tile.dart';
import 'package:flutter/material.dart';

class TextTitleWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  const TextTitleWidget({
    Key? key,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextTitle(
          text: title,
        ),
        SizedBox(height: 8),
        Text(
          subTitle,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColor.primaryTextColor,
            // letterSpacing: 0.7,
          ),
        ),
      ],
    );
  }
}
