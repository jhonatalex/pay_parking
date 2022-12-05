import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  const CardContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0), //todos los lados iguales
      //margin: EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
      // alignment: const Alignment(-0.2, -0.8),
      //height: 540,
      //width: 320,
      decoration: const BoxDecoration(
          color: Color.fromARGB(111, 247, 247, 247),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
              bottomLeft: Radius.circular(40.0),
              bottomRight: Radius.circular(40.0))),
    );
  }
}
