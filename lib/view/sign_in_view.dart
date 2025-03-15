import 'package:crud_project_1/services/auth_service.dart';
import 'package:crud_project_1/theme.dart';
import 'package:crud_project_1/view/widgets/custom_button.dart';
import 'package:crud_project_1/view/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


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
            listLogin('Log In With Facebook', 'assets/google_logo.webp',),
            divider(),
            CustomFormField(
              controller: _emailController,
              labelText: 'Email',
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
          ],
        ),
      );
    }

    Widget bottomSection(){
      return Container(
        padding: EdgeInsets.fromLTRB(15, 10, 15, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomButton(
              title: 'Sign In',
              width: double.infinity,
              onPressed: () async {
                // Tampilkan loading spinner
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) =>
                      const Center(child: CircularProgressIndicator()),
                );
                try {
                  // Panggil method signin di AuthService
                  await AuthService().signin(
                    email: _emailController.text.trim(),
                    password: _passwordController.text,
                    context: context,
                  );
                } catch (e) {
              
                }
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
      body: ListView(
        children: [
          SizedBox(
            height: 30,
          ),
          content(),
        ],
      ),
      bottomNavigationBar: bottomSection(),
    );
  }
}
