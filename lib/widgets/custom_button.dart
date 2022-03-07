import 'package:audacity_demo/config/app_color.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String btnText;
  final double circular;
  final VoidCallback onBtnTap;

  const CustomButton({
    Key? key,
    required this.btnText,
    this.circular = 5,
    required this.onBtnTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 60,
      child: ElevatedButton(
        child: Text(btnText),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColor.primaryAppColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(circular),
            ),
          ),
        ),
        onPressed: () {
          onBtnTap();
        },
      ),
    );
  }
}
