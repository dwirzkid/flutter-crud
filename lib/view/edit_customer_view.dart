import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_project_1/services/firestore_service.dart';
import 'package:crud_project_1/theme.dart';
import 'package:crud_project_1/view/widgets/custom_button.dart';
import 'package:crud_project_1/view/widgets/custom_date_picker_field.dart';
import 'package:crud_project_1/view/widgets/custom_form_edit_field.dart';
import 'package:crud_project_1/view/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditCustomerView extends StatefulWidget {
  const EditCustomerView({super.key});

  @override
  State<EditCustomerView> createState() => _EditCustomerViewState();
}

class _EditCustomerViewState extends State<EditCustomerView> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _bankAccountController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  bool _isLoading = false;
  String? customerId;
  Map<String, dynamic>? customerData;

  @override
  void initState() {
    super.initState();
    // Melakukan pengecekan argument setelah widget diinisialisasi sepenuhnya
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkForArguments();
    });
  }

  void _checkForArguments() {
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args != null && args is String) {
      customerId = args;
      _fetchCustomerData();
    }
  }

  Future<void> _fetchCustomerData() async {
    if (customerId == null) return;
    
    setState(() {
      _isLoading = true;
    });
    
    try {
      final doc = await FirebaseFirestore.instance
          .collection('customers')
          .doc(customerId)
          .get();
          
      final data = doc.data();
      if (data != null) {
        setState(() {
          customerData = data;
          _firstNameController.text = data['firstName'] ?? '';
          _lastNameController.text = data['lastName'] ?? '';
          _phoneController.text = data['phone'] ?? '';
          _dateController.text = data['dateOfBirth'] ?? '';
          _bankAccountController.text = data['bankAccount'] ?? '';
          _emailController.text = data['email'] ?? '';
        });
      } else {
        Fluttertoast.showToast(
          msg: "Customer data not found",
          backgroundColor: Colors.red
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Error fetching data: $e",
        backgroundColor: Colors.red
      );
    }
    
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _updateCustomer() async {
    if (customerId == null) return;
    
    // Validasi: Pastikan semua field terisi
    if (_firstNameController.text.isEmpty ||
        _lastNameController.text.isEmpty ||
        _phoneController.text.isEmpty ||
        _dateController.text.isEmpty ||
        _bankAccountController.text.isEmpty ||
        _emailController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please fill all fields");
      return;
    }

    final updatedData = {
      "firstName": _firstNameController.text.trim(),
      "lastName": _lastNameController.text.trim(),
      "phone": _phoneController.text.trim(),
      "dateOfBirth": _dateController.text.trim(),
      "bankAccount": _bankAccountController.text.trim(),
      "email": _emailController.text.trim(),
      "updatedAt": DateTime.now(),
    };

    setState(() {
      _isLoading = true;
    });
    
    try {
      await FirestoreService().updateCustomer(customerId!, updatedData);
      Fluttertoast.showToast(
        msg: "Customer updated successfully",
        backgroundColor: Colors.green
      );
      Navigator.pop(context); // Kembali setelah update
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Error updating customer: $e", 
          backgroundColor: Colors.red
      );
    }
    
    setState(() {
      _isLoading = false;
    });
  }

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

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: Color(0xffFFEDFA),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          'Edit Customer',
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: medium,
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: true,
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
            CustomFormEditField(
              controller: _firstNameController,
              labelText: 'First Name',
              hintText: 'Michael',
            ),
            CustomFormEditField(
              controller: _lastNameController,
              labelText: 'Last Name',
              hintText: 'Andlewis',
            ),
            CustomFormEditField(
              controller: _phoneController,
              labelText: 'Phone Number',
              hintText: '089421',
              keyboardType: TextInputType.number,
            ),
            CustomDatePickerField(
                labelText: 'Date Of Birth',
                hintText: 'Select Date',
                controller: _dateController),
            CustomFormEditField(
              controller: _bankAccountController,
              labelText: 'Bank Account Number',
              hintText: '8829311',
            ),
            CustomFormEditField(
              controller: _emailController,
              labelText: 'Email',
              hintText: 'mi1ch@gmail.com',
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  title: 'Cancel',
                  width: 120,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                CustomButton(
                  title: 'Update',
                  width: 120,
                  onPressed: () {
                    _updateCustomer();
                  },
                )
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
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
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