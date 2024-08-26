import 'package:flutter/material.dart';

class HomeScreenWidget extends StatefulWidget {
  final String text1;
  final String text2;
  final VoidCallback? onPressed;

  const HomeScreenWidget({
    Key? key,
    required this.text1,
    required this.text2,
     this.onPressed,
  }) : super(key: key);

  @override
  State<HomeScreenWidget> createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.text1,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black
          ),
        ),
        GestureDetector(
          onTap: widget.onPressed,
          child: Text(
            widget.text2,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black, // Change the color to your preference
            ),
          ),
        ),
      ],
    );
  }
}
