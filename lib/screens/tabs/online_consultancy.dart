import 'package:audacity_demo/config/app_color.dart';
import 'package:audacity_demo/widgets/text_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:audacity_demo/widgets/custom_button.dart';
import 'package:audacity_demo/widgets/key_point_widget.dart';
import 'package:audacity_demo/widgets/text_tile.dart';

class OnlineConsultancy extends StatelessWidget {
  const OnlineConsultancy({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> specializationList = [
      'Eye Specialist',
      'Child Specialist',
      'Gastroentrologist,'
    ];
    List<String> treatmentServiceList = [
      'Comprehensive eye care',
      'Corneal Transplant',
      'Phacomulsification (Phaco Contact Seegry) & Photo',
      'Glasses Removal Surgery',
    ];
    List<String> educationList = [
      'MBBS, 2004',
      'MCPS (Opthalmology), 2011',
    ];
    List<String> experienceList = [
      '2015 - Present, Assistant Professor, Holy Cross Medical',
    ];
    List<String> membershipList = ['Bangladesh Medical Commision (BMC)'];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextTitleWidget(
            title: 'Fees',
            subTitle: 'BDT 500',
          ),
          SizedBox(height: 16),
          TextTitle(text: 'Available Hours'),
          SizedBox(height: 16),
          ListView.builder(
            itemCount: 2,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return ScheduleTile(
                day: 'Sunday',
                schedule:
                    '7:00 AM - 8:00 AM  •  7:00 AM - 8:00 AM  •  7:00 AM - 8:00 AM',
              );
            },
          ),
          SizedBox(height: 16),
          CustomButton(
            btnText: 'Book Schedule',
            onBtnTap: () {},
          ),
          SizedBox(height: 32),
          Divider(color: AppColor.dividerColor),
          KeypointWidget(
            title: 'Specialization',
            keyPoints: specializationList,
          ),
          Divider(color: AppColor.dividerColor),
          KeypointWidget(
            title: 'Treatment Services',
            keyPoints: treatmentServiceList,
          ),
          Divider(color: AppColor.dividerColor),
          KeypointWidget(
            title: 'Education',
            keyPoints: educationList,
          ),
          Divider(color: AppColor.dividerColor),
          KeypointWidget(
            title: 'Experience',
            keyPoints: experienceList,
          ),
          Divider(color: AppColor.dividerColor),
          KeypointWidget(
            title: 'Professional Membership',
            keyPoints: membershipList,
          ),
          Divider(color: AppColor.dividerColor),
          TextTitleWidget(
            title: 'About Dr. Imtiaz Hossain Chowdhury',
            subTitle:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
          ),
        ],
      ),
    );
  }
}
