import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {

  final String title;
  final Color titleColor;
  final double width;
  final double height;
  final onPressed;

  CustomButton({
    required this.title, 
    this.titleColor = Colors.black,
    this.width  = 400, 
    this.height = 50,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      width: this.width,
      child: OutlinedButton(
        onPressed: this.onPressed,
        child: Text(this.title, style: TextStyle(fontSize: 20, color: this.titleColor)),
        style: OutlinedButton.styleFrom(
          primary: Colors.black,
          backgroundColor: Colors.blueGrey[600]
        ), 
      ),      
    );
  }
}