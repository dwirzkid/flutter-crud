import 'package:crud_project_1/theme.dart';
import 'package:crud_project_1/view/widgets/custom_button.dart';
import 'package:crud_project_1/view/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    bool isChecked = false;

    PreferredSizeWidget header() {
      return AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Register',
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
        margin: EdgeInsets.only(
          left: 15, right: 15, bottom: 20,
        ),
        child: Column(
          children: [
            listLogin(
              'Log In With Google',
              'assets/facebook.png',
            ),
            listLogin(
              'Log In With Facebook',
              'assets/google_logo.webp',
            ),
            divider(),
            CustomFormField(
              labelText: 'Name',
              hintText: 'Enter your name',
            ),
            CustomFormField(
              labelText: 'Email',
              hintText: 'Enter your email',
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (bool? newValue) {
                    setState(() {
                      isChecked = newValue!;
                    });
                  },
                  activeColor: Colors.blue,
                ),
                Text(
                  'I accept and agree to comply',
                  style: blackTextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            CustomButton(
              title: 'Register',
              width: double.infinity,
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/sign-in', (route) => false);
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Have an account?',
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
                    Navigator.pushNamed(context, '/sign-in');
                  },
                  child: Text(
                    'Login',
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
      body: ListView(
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
