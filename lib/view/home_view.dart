import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_project_1/services/firestore_service.dart';
import 'package:crud_project_1/theme.dart';
import 'package:crud_project_1/view/widgets/customer_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final FirestoreService firestoreService = FirestoreService();

  final TextEditingController firstNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future<void> showDeleteDialog(
        BuildContext context, String customerId, String customerName) {
      return showDialog(
        context: context,
        builder: (dialogContext) => Container(
          width: MediaQuery.of(dialogContext).size.width - (2 * 30),
          child: AlertDialog(
            backgroundColor: const Color(0xffFFEDFA),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Tombol untuk menutup dialog
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(dialogContext);
                      },
                      child: const Icon(Icons.close),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Tampilkan pesan dan nama customer
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Are you sure to delete?',
                            style: blackTextStyle.copyWith(
                              fontWeight: light,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            customerName,
                            style: blackTextStyle.copyWith(
                              fontWeight: semiBold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      // Tombol Delete dan Cancel
                      Column(
                        children: [
                          Container(
                            width: 70,
                            height: 30,
                            child: TextButton(
                              onPressed: () async {
                                try {
                                  await FirestoreService()
                                      .deleteCustomer(customerId);
                                  Navigator.pop(dialogContext);
                                  Fluttertoast.showToast(
                                    msg: "Customer deleted successfully",
                                    backgroundColor: Colors.green,
                                  );
                                } catch (e) {
                                  Navigator.pop(dialogContext);
                                  Fluttertoast.showToast(
                                      msg: "Error deleting customer: $e",
                                      backgroundColor: Colors.red);
                                }
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: const Color(0xffEC7FA9),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text(
                                'Delete',
                                style: blackTextStyle.copyWith(
                                  fontWeight: semiBold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 7),
                          Container(
                            width: 70,
                            height: 30,
                            child: TextButton(
                              onPressed: () {
                                Navigator.pop(dialogContext);
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text(
                                'Cancel',
                                style: blackTextStyle.copyWith(
                                  fontWeight: semiBold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    Future<void> showLogoutDialog() {
      return showDialog(
        context: context,
        builder: (BuildContext) => Container(
          width: MediaQuery.of(context).size.width - (2 * 30),
          child: AlertDialog(
            backgroundColor: Color(0xffFFEDFA),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.close),
                    ),
                  ),
                  SizedBox(height: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Are you sure to exit',
                        style: blackTextStyle.copyWith(
                          fontWeight: light,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    height: 30,
                    child: TextButton(
                      onPressed: () async {
                        // Tutup dialog terlebih dahulu
                        Navigator.pop(context);
                        try {
                          // Panggil signOut dari Firebase
                          await FirebaseAuth.instance.signOut();
                          // Arahkan ke menu awal dengan menghapus semua rute sebelumnya
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            '/',
                            (route) => false,
                          );
                        } catch (e) {
                          Fluttertoast.showToast(
                            msg: 'Logout failed, please try again.',
                            backgroundColor: Colors.red,
                          );
                        }
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xffEC7FA9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Logout',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    Widget header() {
      return Container(
        height: 75,
        width: double.infinity,
        color: Color(0xffFFEDFA),
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Text(
              'Customer List',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
            Spacer(),
            SizedBox(
              width: 150,
              child: TextFormField(
                style: blackTextStyle,
                decoration: InputDecoration(
                  hintText: 'Search',
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: () {
                showLogoutDialog();
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xffEC7FA9),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: const Icon(
                  Icons.list_sharp,
                  size: 24,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 30),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 110,
                    height: 35,
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 0.3,
                        ),
                        borderRadius: BorderRadius.circular(6)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Last 30 years',
                          style: blackTextStyle.copyWith(fontSize: 10),
                        ),
                        Icon(Icons.keyboard_arrow_down, size: 20),
                      ],
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 35,
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 0.3,
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.filter_list_rounded, size: 20),
                        SizedBox(width: 19),
                        Text('Filters',
                            style: blackTextStyle.copyWith(fontSize: 10)),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/add-customer');
                    },
                    child: Container(
                      width: 110,
                      height: 35,
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 0.3,
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Add Customer',
                            style: blackTextStyle.copyWith(fontSize: 10),
                          ),
                          Icon(
                            Icons.add,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirestoreService().getCustomers(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return const Center(child: Text('No Costumer found'));
                    }
                    final docs = snapshot.data!.docs;
                    return ListView.builder(
                      itemCount: docs.length,
                      itemBuilder: (context, index) {
                        final data = docs[index].data() as Map<String, dynamic>;
                        final String firstName = data['firstName'] ?? "";
                        final String lastName = data['lastName'] ?? "";
                        final String email = data['email'] ?? "";
                        final String fullName = "$firstName $lastName".trim();
                        final String customerId = docs[index].id;
                        final String customerName = fullName;

                        return CustomerCard(
                          fullName: fullName,
                          email: email,
                          onDelete: () {
                            showDeleteDialog(context, customerId, customerName);
                          },
                          onEdit: () {
                            Navigator.pushNamed(
                              context,
                              '/edit-customer',
                              arguments: customerId,
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
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
