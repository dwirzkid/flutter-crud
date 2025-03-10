import 'package:crud_project_1/view/add_customer_view.dart';
import 'package:crud_project_1/view/edit_customer_view.dart';
import 'package:crud_project_1/view/home_view.dart';
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
        '/': (context) => HomeView(),
        '/add-customer': (context) => AddCustomerView(),
        '/edit-customer': (context) => EditCustomerView(),
      },
    );
  }
}
