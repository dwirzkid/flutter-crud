import 'package:crud_project_1/services/firestore_service.dart';
import 'package:crud_project_1/theme.dart';
import 'package:crud_project_1/view/widgets/custom_date_picker_field.dart';
import 'package:crud_project_1/view/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddCustomerView extends StatefulWidget {
  const AddCustomerView({super.key});

  @override
  State<AddCustomerView> createState() => _AddCustomerViewState();
}

class _AddCustomerViewState extends State<AddCustomerView> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _bankAccountController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _dateController.dispose();
    _bankAccountController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _saveCustomer() async {
    if (_firstNameController.text.isEmpty ||
        _lastNameController.text.isEmpty ||
        _phoneController.text.isEmpty ||
        _dateController.text.isEmpty ||
        _bankAccountController.text.isEmpty ||
        _emailController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please fill all fields");
      return;
    }

    Map<String, dynamic> customerData = {
      "firstName": _firstNameController.text.trim(),
      "lastName": _lastNameController.text.trim(),
      "phone": _phoneController.text.trim(),
      "dateOfBirth": _dateController.text.trim(),
      "bankAccount": _bankAccountController.text.trim(),
      "email": _emailController.text.trim(),
      "createdAt": DateTime.now(),
    };

    try {
      await FirestoreService().addCustomer(customerData);
      Fluttertoast.showToast(
        msg: "Customer added successfully",
        backgroundColor: Colors.green,
      );
      Navigator.pop(context);
    } catch (e) {
      Fluttertoast.showToast(msg: "Error adding customer: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: Color(0xffFFEDFA),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          'Add Customer',
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: medium,
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: true,
      );
    }

    Widget buttonSave() {
      return GestureDetector(
        onTap: () {
          _saveCustomer();
        },
        child: Container(
          width: 100,
          height: 40,
          margin: EdgeInsets.only(top: 50),
          decoration: BoxDecoration(
            color: Color(0xffEC7FA9),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Save',
                style: whiteTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: medium,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }

    Widget buttonCancel() {
      return GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          width: 100,
          height: 40,
          margin: EdgeInsets.only(top: 50),
          decoration: BoxDecoration(
            color: Color(0xffEC7FA9),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Cancel',
                style: whiteTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: medium,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomFormField(
              controller: _firstNameController,
              labelText: 'First Name',
              hintText: 'Michael',
            ),
            CustomFormField(
              controller: _lastNameController,
              labelText: 'Last Name',
              hintText: 'Andlewis',
            ),
            CustomFormField(
              controller: _phoneController,
              labelText: 'Phone Number',
              hintText: '089421',
              keyboardType: TextInputType.number,
            ),
            CustomDatePickerField(
                labelText: 'Date Of Birth',
                hintText: 'Select Date',
                controller: _dateController),
            CustomFormField(
              controller: _bankAccountController,
              labelText: 'Bank Account Number',
              hintText: '8829311',
            ),
            CustomFormField(
              controller: _emailController,
              labelText: 'Email',
              hintText: 'mi1ch@gmail.com',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buttonCancel(),
                buttonSave(),
              ],
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Color(0xffFFEDFA),
      appBar: header(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              content(),
            ],
          ),
        ),
      ),
    );
  }
}
