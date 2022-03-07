import 'package:flutter/material.dart';

import 'package:audacity_demo/config/app_color.dart';

class TextTile extends StatelessWidget {
  final String title;
  final String subtitle;
  const TextTile({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColor.primaryTextColor,
            // letterSpacing: 0.7,
          ),
        ),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 14,
            color: AppColor.secondaryTextColor,
          ),
        ),
      ],
    );
  }
}

class RatingTile extends StatelessWidget {
  final String title1;
  final String title2;
  final String subtitle;
  const RatingTile({
    Key? key,
    required this.title1,
    required this.title2,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.star,
              size: 16,
              color: AppColor.primaryAppColor,
            ),
            Text(
              title1,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColor.primaryTextColor,
                // letterSpacing: 0.7,
              ),
            ),
            Text(title2),
          ],
        ),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 14,
            color: AppColor.secondaryTextColor,
          ),
        ),
      ],
    );
  }
}

class TextTitle extends StatelessWidget {
  final String text;
  const TextTitle({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColor.primaryTextColor,
      ),
    );
  }
}

class ScheduleTile extends StatelessWidget {
  final String day;
  final String schedule;
  const ScheduleTile({
    Key? key,
    required this.day,
    required this.schedule,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            day,
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            width: width * 0.65,
            child: Text(
              schedule,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColor.primaryTextColor,
              ),
            ),
          ),
          SizedBox(width: 16),
        ],
      ),
    );
  }
}
