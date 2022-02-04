import 'package:flutter/material.dart';

class MainField extends StatelessWidget {
  const MainField({
    Key? key,
    required this.fieldController,
    required this.label,
    required this.fieldIcon,
    required this.obscureText,
  }) : super(key: key);

  final TextEditingController fieldController;
  final String label;
  final IconData fieldIcon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: (value){
        fieldController.text = value!;
      },
      controller: fieldController,
      obscureText: obscureText,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(fieldIcon),
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
      ),
    );
  }
}