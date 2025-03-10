import 'package:crud_project_1/theme.dart';
import 'package:crud_project_1/view/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';

class EditCustomerView extends StatelessWidget {
  const EditCustomerView({super.key});

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

    Widget buttonSave() {
      return GestureDetector(
        onTap: () {},
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
                'Update',
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
              labelText: 'First Name',
              hintText: 'Michael',
            ),
            CustomFormField(
              labelText: 'Last Name',
              hintText: 'Andlewis',
            ),
            CustomFormField(
              labelText: 'Phone Number',
              hintText: '089421',
            ),
            CustomFormField(
              labelText: 'Date Of Birth',
              hintText: '8 March 1992',
            ),
            CustomFormField(
              labelText: 'Bank Account Number',
              hintText: '8829311',
            ),
            CustomFormField(
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
