import 'package:crud_project_1/theme.dart';
import 'package:crud_project_1/view/widgets/custom_button.dart';
import 'package:crud_project_1/view/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Forgot Password',
          style: blackTextStyle.copyWith(
            // fontSize: 1,
            fontWeight: semiBold,
          ),
        ),
        elevation: 0,
      );
    }

    Widget content() {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Column(
          children: [
            CustomFormField(
              labelText: 'Email',
              hintText: 'Enter your email',
            ),
            CustomButton(
              title: 'Submit',
              width: double.infinity,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Don\'t have an account?',
                  style: blackTextStyle.copyWith(
                    fontWeight: light,
                    fontSize: 10,
                  ),
                ),
                SizedBox(
                  width: 3,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/sign-up');
                  },
                  child: Text(
                    'Register',
                    style: blackTextStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: header(),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          content(),
        ],
      ),
    );
  }
}
