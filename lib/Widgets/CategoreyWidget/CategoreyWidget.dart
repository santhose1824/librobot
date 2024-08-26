import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoreyWidget extends StatefulWidget {
  final String text;
  CategoreyWidget({required this.text});

  @override
  State<CategoreyWidget> createState() => _CategoreyWidgetState();
}

class _CategoreyWidgetState extends State<CategoreyWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black,
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          widget.text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
