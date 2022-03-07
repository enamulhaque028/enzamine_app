import 'package:audacity_demo/config/app_color.dart';
import 'package:audacity_demo/widgets/custom_button.dart';
import 'package:audacity_demo/widgets/schedulewidget.dart';
import 'package:audacity_demo/widgets/text_tile.dart';
import 'package:audacity_demo/widgets/text_title_widget.dart';
import 'package:flutter/material.dart';

class LocationAndHours extends StatelessWidget {
  final String hospital;
  final String location;
  final String fees;
  final VoidCallback onTapBook;
  const LocationAndHours({
    Key? key,
    required this.hospital,
    required this.location,
    required this.fees,
    required this.onTapBook,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[100]!,
              blurRadius: 1.0,
            ),
          ],
        ),
        child: Card(
          // elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextTitle(
                  text: hospital,
                ),
                SizedBox(height: 4),
                Text(
                  location,
                  style: TextStyle(
                    color: AppColor.secondaryTextColor,
                  ),
                ),
                Divider(),
                TextTitleWidget(
                  title: 'Fees',
                  subTitle: 'BDT $fees',
                ),
                Divider(),
                ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return SchwduleWidget(
                      days: 'Monday',
                      schedule: '8:00 PM - 10:00 PM',
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 12),
                  child: CustomButton(
                    btnText: 'Book Appointment',
                    onBtnTap: () {
                      onTapBook();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
