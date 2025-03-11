import 'package:crud_project_1/theme.dart';
import 'package:crud_project_1/view/widgets/custom_button.dart';
import 'package:crud_project_1/view/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Log In',
          style: blackTextStyle.copyWith(
            // fontSize: 1,
            fontWeight: semiBold,
          ),
        ),
        elevation: 0,
      );
    }

    Widget divider() {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          children: [
            Expanded(
              child: Divider(
                color: greyColor,
                thickness: 0.4,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text("Or Login With Email",
                  style: blackTextStyle.copyWith(
                    fontWeight: medium,
                  )),
            ),
            Expanded(
              child: Divider(
                color: greyColor,
                thickness: 0.4,
              ),
            ),
          ],
        ),
      );
    }

    Widget listLogin(String title, String imagePath) {
      return Container(
        // margin: EdgeInsets.symmetric(horizontal: 15),
        padding: EdgeInsets.only(top: 10),
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xffFFB8E0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 10,
                      backgroundImage: AssetImage(
                        imagePath,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      title,
                      style: whiteTextStyle,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Column(
          children: [
            listLogin('Log In With Google', 'assets/facebook.png',),
            listLogin('Log In With Facebook', 'assets/image_profile.jpeg',),
            divider(),
            CustomFormField(
              labelText: 'Email',
              hintText: 'Enter your name',
            ),
            CustomFormField(
              labelText: 'Password',
              hintText: 'Enter your password',
              obscureText: true,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/forgot-password');
                  },
                  child: Text(
                    'Forgot Password?',
                    style: blackTextStyle.copyWith(
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
            CustomButton(
              title: 'Log In',
              width: double.infinity,
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
              },
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
