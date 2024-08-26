import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextWidget extends StatefulWidget {
  final String text;
  TextWidget({required this.text});

  @override
  State<TextWidget> createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: TextStyle(
        color: Colors.black,
        fontSize: 15.sp,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.justify,
    );
  }
}
