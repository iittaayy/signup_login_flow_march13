import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    Key? key,
    required this.fieldLabel,
    required this.onPress,
  }) : super(key: key);

  final String fieldLabel;
  final VoidCallback onPress;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      width: double.infinity, // <-- match_parent
      child: ElevatedButton(
        onPressed: onPress, child: Text(fieldLabel, style: TextStyle(fontSize: 16.0,),),),
    );
  }
}