import 'package:flutter/material.dart';

class SchwduleWidget extends StatelessWidget {
  final String days;
  final String schedule;
  const SchwduleWidget({
    Key? key,
    required this.days,
    required this.schedule,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Text(
            days,
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          SizedBox(width: 8),
          Text(
            schedule,
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
