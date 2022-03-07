import 'package:audacity_demo/config/app_color.dart';
import 'package:audacity_demo/widgets/text_tile.dart';
import 'package:flutter/material.dart';

class KeypointWidget extends StatelessWidget {
  const KeypointWidget({
    Key? key,
    required this.title,
    required this.keyPoints,
  }) : super(key: key);

  final String title;
  final List<String> keyPoints;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextTitle(text: title),
        SizedBox(height: 8),
        ListView.builder(
          itemCount: keyPoints.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                '•  ${keyPoints[index]}',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColor.primaryTextColor,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
