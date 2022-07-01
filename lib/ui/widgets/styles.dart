import 'package:flutter/material.dart';

class shadowStyle extends StatelessWidget {
  shadowStyle();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

final doSpace20 = SizedBox(
  height: 20,
  width: 20,
);

final doSpace10 = SizedBox(
  height: 10,
  width: 10,
);

class GradientBack extends StatelessWidget {
  var color1 = Color(0xff426bd3);
  var color2 = Color(0xff5d4bd1);
  int radius = 10;
  GradientBack(this.color1, this.color2, this.radius);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            gradient: LinearGradient(
              colors: [
                Color(0xff426bd3),
                Color(0xff5d4bd1),
              ],
              begin: FractionalOffset(0.3, 0.0),
              end: FractionalOffset(1.0, 0.6),
              stops: [0.0, 0.6],
              tileMode: TileMode.clamp,
            )));
  }
}
