import 'package:crud_project_1/theme.dart';
import 'package:flutter/material.dart';

class CustomFormEditField extends StatelessWidget {

  final String labelText;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final TextEditingController? controller;

  const CustomFormEditField({
    required this.labelText,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.controller, 
    super.key
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: blackTextStyle.copyWith(
              fontSize: 14,
              fontWeight: medium,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 0.3),
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextFormField(
              style: greyTextStyle,
              controller: controller,
              keyboardType: keyboardType,
              obscureText: obscureText,
              decoration: InputDecoration.collapsed(
                hintText: hintText,
                hintStyle: blackTextStyle.copyWith(
                  color: Colors.grey.withOpacity(0.6),
                  fontWeight: light,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
