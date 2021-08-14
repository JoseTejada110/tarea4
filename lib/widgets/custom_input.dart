import 'package:flutter/material.dart';


class CustomInput extends StatelessWidget {

  final String placeholder;
  final double width;
  final TextInputType keyboardType;
  final bool isPassword;
  final TextEditingController textController;

  CustomInput({
    required this.placeholder,
    this.width = 400,
    required this.keyboardType,
    this.isPassword = false,
    required this.textController, 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      padding: EdgeInsets.only(top:8,bottom:8,left:8,right:22),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 2.0)
      ),

      child: TextField(
        controller: this.textController,
        textCapitalization: TextCapitalization.none,
        obscureText: this.isPassword,
        keyboardType: this.keyboardType,
        decoration: InputDecoration(
          hintText: this.placeholder,
          focusColor: Colors.black,
          focusedBorder: InputBorder.none,
          border: InputBorder.none
        ),
      ),
    );
  }
}