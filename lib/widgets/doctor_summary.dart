import 'package:audacity_demo/config/app_color.dart';
import 'package:audacity_demo/widgets/text_tile.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class DoctorSummary extends StatelessWidget {
  const DoctorSummary({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Image.asset('assets/images/1.png'),
          // child: SvgPicture.asset(
          //   'assets/images/dr_image.svg',
          // ),
        ),
        SizedBox(height: 8),
        Text(
          'Dr. Imtiaz Hossan Chowdhury',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColor.primaryTextColor,
            letterSpacing: 0.7,
          ),
        ),
        SizedBox(height: 4),
        Text(
          'Eye Specialist, MBBS, MCPS (Opthalmology)',
          style: TextStyle(
            fontSize: 14,
            color: AppColor.secondaryTextColor,
          ),
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextTile(
              title: '615',
              subtitle: 'Patients Treated',
            ),
            TextTile(
              title: '8 Years',
              subtitle: 'Experience',
            ),
            RatingTile(
              title1: '4.7 ',
              title2: '(152)',
              subtitle: 'Average Rating',
            ),
          ],
        ),
      ],
    );
  }
}
