import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  void Function(String) onChanged;
  String? labelText = '';
  String? hintText = '';
  final Icon icon;
  CustomTextField({
    super.key, required this.onChanged, required this.icon,
    this.labelText,this.hintText
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: labelText ?? 'text',
          hintText: hintText ?? 'Enter your text',

          prefixIcon: icon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0), // Rounded border
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: Colors.blue), // Border when focused
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: Colors.grey), // Border when not focused
            borderRadius: BorderRadius.circular(10.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Colors.red), // Border when there's an error
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
