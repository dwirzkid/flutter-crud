import 'package:crud_project_1/theme.dart';
import 'package:flutter/material.dart';

class CustomerCard extends StatelessWidget {
  final String fullName;
  final String email;
  final VoidCallback? onDelete;
  final VoidCallback? onEdit;
  final VoidCallback? onPressed;

  const CustomerCard({
    required this.fullName,
    required this.email,
    this.onDelete,
    this.onEdit,
    this.onPressed,
    super.key,
  });

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
                  fullName,
                  style: blackTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: semiBold,
                  ),
                ),
                Text(
                  email,
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
                onPressed: onDelete,
                icon: const Icon(Icons.delete_outline, color: Colors.red),
              ),
              IconButton(
                onPressed: onEdit,
                icon: const Icon(Icons.edit_outlined),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
