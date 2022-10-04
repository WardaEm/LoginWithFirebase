import 'package:flutter/material.dart';
class Button extends StatelessWidget {

 final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;

  Button({required this.text, required this.onPressed, required this.color, required this.textColor, });

  @override
  Widget build(BuildContext context) {
   return SizedBox(
      height: 60,
      width: double.infinity,
      child: RaisedButton(color:color,
        onPressed:
          onPressed,// Navigator.of(context).pushNamed('login');
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(20)),child: Text(text,
          style: TextStyle(
              color:textColor ,fontSize: 20
          ),),),
    );
  }
}
