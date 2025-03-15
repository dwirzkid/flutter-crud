import 'package:crud_project_1/services/auth_service.dart';
import 'package:crud_project_1/theme.dart';
import 'package:crud_project_1/view/sign_in_view.dart';
import 'package:crud_project_1/view/widgets/custom_button.dart';
import 'package:crud_project_1/view/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpView extends StatefulWidget {
  SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
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
          left: 15,
          right: 15,
          bottom: 20,
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
              controller: _fullNameController,
              labelText: 'Name',
              hintText: 'Enter your name',
            ),
            CustomFormField(
              labelText: 'Email',
              controller: _emailController,
              hintText: 'Enter your email',
            ),
            CustomFormField(
              controller: _passwordController,
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
          ],
        ),
      );
    }

    Widget bottomSection(BuildContext context) {
      return Container(
        padding: EdgeInsets.fromLTRB(15, 10, 15, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomButton(
              title: 'Register',
              width: double.infinity,
              onPressed: () async {
                // Validasi checkbox
                if (!isChecked) {
                  Fluttertoast.showToast(
                    msg: 'Please accept the terms and conditions',
                    backgroundColor: Colors.red,
                  );
                  return;
                }

                // Validasi field Full Name, Email, dan Password
                if (_fullNameController.text.trim().isEmpty ||
                    _emailController.text.trim().isEmpty ||
                    _passwordController.text.isEmpty) {
                  Fluttertoast.showToast(
                    msg: 'Please fill all fields',
                    backgroundColor: Colors.red,
                  );
                  return;
                }

              
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) =>
                      const Center(child: CircularProgressIndicator()),
                );

                try {
            
                  await AuthService().signup(
                    fullName: _fullNameController.text.trim(),
                    email: _emailController.text.trim(),
                    password: _passwordController.text,
                    context: context,
                  );
             
                } catch (e) {
                  throw e;
                }
              },
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
          SizedBox(height: 30),
          content(),
        ],
      ),
      bottomNavigationBar: bottomSection(context),
    );
  }
}
