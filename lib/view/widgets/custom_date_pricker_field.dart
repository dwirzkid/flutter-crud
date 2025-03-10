import 'package:flutter/material.dart';

class CustomDatePickerField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;

  const CustomDatePickerField({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  _CustomDatePickerFieldState createState() => _CustomDatePickerFieldState();
}

class _CustomDatePickerFieldState extends State<CustomDatePickerField> {
  Future<void> _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        widget.controller.text =
            "${pickedDate.day} ${_getMonthName(pickedDate.month)} ${pickedDate.year}";
      });
    }
  }

  String _getMonthName(int month) {
    List<String> months = [
      "",
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];
    return months[month];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _selectDate,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.labelText,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8),
          TextFormField(
            controller: widget.controller,
            readOnly: true,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
