import 'package:flutter/material.dart';

class NewArrivalWidget extends StatefulWidget {
  final imagePath;
  NewArrivalWidget({required this.imagePath});

  @override
  State<NewArrivalWidget> createState() => _NewArrivalWidgetState();
}

class _NewArrivalWidgetState extends State<NewArrivalWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        widget.imagePath,
        height: 200,
        width: 170,
      ),
    );
  }
}
