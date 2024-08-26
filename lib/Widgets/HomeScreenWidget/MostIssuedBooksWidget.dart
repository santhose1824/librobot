import 'package:flutter/material.dart';

class MostIssuedBooksWidget extends StatefulWidget {
  final imagePath;
  MostIssuedBooksWidget({required this.imagePath});

  @override
  State<MostIssuedBooksWidget> createState() => _MostIssuedBooksWidgetState();
}

class _MostIssuedBooksWidgetState extends State<MostIssuedBooksWidget> {
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
