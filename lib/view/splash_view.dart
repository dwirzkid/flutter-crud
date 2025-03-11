import 'package:crud_project_1/theme.dart';
import 'package:crud_project_1/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Expanded(
        child: Center(
          child: Image.asset(
            'assets/hello_rev_1.png',
            width: 350,
            height: 400,
            fit: BoxFit.contain,
          ),
        ),
      );
    }

    Widget buttonGuest() {
      return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: SizedBox(
          height: 50,
          width: double.infinity,
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: Color(0xffFFEDFA),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'Continue With Guest',
              style: blackTextStyle.copyWith(
                fontWeight: semiBold,
              ),
            ),
          ),
        ),
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize:
              MainAxisSize.min,
          children: [
            Text(
              'Start To Make',
              style: blackTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'try to make some people in one application',
              style: blackTextStyle.copyWith(
                fontSize: 12,
                fontWeight: light,
              ),
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  title: 'Log in',
                  onPressed: () {
                    // Navigator.pushNamedAndRemoveUntil(
                    //     context, '/sign-in', (route) => false);
                    Navigator.pushNamed(context, '/sign-in');
                  },
                  width:
                      MediaQuery.of(context).size.width * 0.4,
                ),
                CustomButton(
                  title: 'Register',
                  onPressed: () {
                    Navigator.pushNamed(context, '/sign-up');
                  },
                  width:
                      MediaQuery.of(context).size.width * 0.4, 
                ),
              ],
            ),
            buttonGuest(),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Color(0xffFFEDFA),
      body: SafeArea(
        child: Column(
          children: [
            header(),
            content(),
          ],
        ),
      ),
    );
  }
}
