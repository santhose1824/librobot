import 'package:flutter/material.dart';

class AuthTextFeilds extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final Widget prefixIcon;
  final bool obsecureText;

  AuthTextFeilds({
    required this.controller,
    required this.obsecureText,
    required this.hint,
    required this.prefixIcon,
  });

  @override
  State<AuthTextFeilds> createState() => _AuthTextFeildsState();
}

class _AuthTextFeildsState extends State<AuthTextFeilds> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.obsecureText,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: TextStyle(color: Colors.black), // Set hint text color to black
        prefixIcon: widget.prefixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}
