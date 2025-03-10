import 'package:crud_project_1/theme.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;

  const CustomButton({
    required this.title,
    this.onPressed,
    this.width,  
    this.height, 
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? 50,
      margin: EdgeInsets.only(top: 50),
      decoration: BoxDecoration(
        color: Color(0xffEC7FA9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: whiteTextStyle.copyWith(
              fontSize: 18,
              fontWeight: medium,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
