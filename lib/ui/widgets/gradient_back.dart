import 'package:flutter/material.dart';

class GradientBack extends StatelessWidget {
  String title = "";

  GradientBack();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 231, 231, 233),
                Color(0xFF2196f3),
              ],
              begin: FractionalOffset.center,
              end: FractionalOffset.bottomCenter,
              stops: [0.2, 0.5],
              tileMode: TileMode.clamp)),
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontFamily: "Lato",
            fontWeight: FontWeight.bold),
      ),
      alignment: const Alignment(-0.2, -0.8),
    );
  }
}
