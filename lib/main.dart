import 'package:crud_project_1/view/add_customer_view.dart';
import 'package:crud_project_1/view/edit_customer_view.dart';
import 'package:crud_project_1/view/forget_password_view.dart';
import 'package:crud_project_1/view/home_view.dart';
import 'package:crud_project_1/view/sign_in_view.dart';
import 'package:crud_project_1/view/sign_up_view.dart';
import 'package:crud_project_1/view/splash_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashView(),
        '/sign-in': (context) => SignInView(),
        '/sign-up': (context) => SignUpView(),
        '/forgot-password': (context) => ForgetPasswordView(),
        '/home': (context) => HomeView(),
        '/add-customer': (context) => AddCustomerView(),
        '/edit-customer': (context) => EditCustomerView(),
      },
    );
  }
}
