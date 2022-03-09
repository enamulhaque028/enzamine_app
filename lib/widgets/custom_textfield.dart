import 'package:aits_task/config/presentation/app_color.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String placeholderText;
  final TextEditingController textEditingController;
  final bool readOnly;
  final IconData icon;
  final bool obscureText;
  final Color textColor;

  const CustomTextField({
    Key? key,
    required this.placeholderText,
    required this.textEditingController,
    this.readOnly = false,
    required this.icon,
    this.obscureText = false,
    this.textColor = AppColor.primaryTextColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: SizedBox(
        height: 48,
        child: TextFormField(
          controller: textEditingController,
          validator: (value) => value!.isEmpty ? '* required' : null,
          readOnly: readOnly,
          obscureText: obscureText,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            labelText: placeholderText,
            labelStyle: TextStyle(
              color: textColor,
              fontSize: 15,
            ),
            prefixIcon: Icon(
              icon,
              color: AppColor.primaryTextColor,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: const BorderSide(
                color: AppColor.borderColor,
                width: 1,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: const BorderSide(
                color: AppColor.borderColor,
                width: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
