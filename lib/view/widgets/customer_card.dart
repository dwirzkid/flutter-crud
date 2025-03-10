import 'package:crud_project_1/theme.dart';
import 'package:flutter/material.dart';

class CustomerCard extends StatelessWidget {
  final VoidCallback? onPressed;

  const CustomerCard({this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      margin: EdgeInsets.only(top: 25),
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.4,
          ),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage('assets/image_profile.jpeg'),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Jane Lopez',
                  style: blackTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: semiBold,
                  ),
                ),
                Text(
                  'jenniferlopez2@gmail.com',
                  style: blackTextStyle.copyWith(
                    fontSize: 11,
                    fontWeight: light,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: onPressed,
                icon: const Icon(Icons.delete_outline, color: Colors.red),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/edit-customer');
                },
                icon: const Icon(Icons.edit_outlined),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
