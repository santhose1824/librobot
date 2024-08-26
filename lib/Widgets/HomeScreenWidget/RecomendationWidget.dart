import 'package:flutter/material.dart';

class RecommendationWidget extends StatefulWidget {
  final imagePath;
  RecommendationWidget({required this.imagePath});

  @override
  State<RecommendationWidget> createState() => _RecommendationWidgetState();
}

class _RecommendationWidgetState extends State<RecommendationWidget> {
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
