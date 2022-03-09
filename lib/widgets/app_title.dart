import 'package:aits_task/config/presentation/app_color.dart';
import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Virtunus',
      style: TextStyle(
        fontSize: 52.0,
        fontWeight: FontWeight.bold,
        foreground: Paint()..shader = AppColor.linearGradient,
      ),
    );
  }
}