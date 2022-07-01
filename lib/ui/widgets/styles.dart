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

//LISTADO DE SOMBRAS
final ShadowBlack = BoxShadow(
  color: Colors.black,
  blurStyle: BlurStyle.normal,
  offset: Offset(-3.0, 2.0),
  blurRadius: 5,
);
final ShadowBlueDown = BoxShadow(
  color: Colors.blue,
  blurStyle: BlurStyle.normal,
  offset: Offset(0.0, 5.0),
  blurRadius: 5,
);
//LISTADO DE GRADIENTES
final GradientPurple = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color(0xff426bd3),
    Color(0xff5d4bd1),
  ],
);
final GradientRed = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color.fromARGB(255, 214, 139, 26),
    Color.fromARGB(255, 212, 38, 38),
  ],
);
final GradientPink = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color.fromARGB(255, 107, 26, 214),
    Color.fromARGB(255, 212, 38, 189),
  ],
);
final GradientGreen = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color.fromARGB(255, 15, 163, 47),
    Color.fromARGB(255, 98, 240, 16),
  ],
);
final GradientBlue = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color.fromARGB(255, 15, 67, 163),
    Color.fromARGB(255, 28, 192, 238),
  ],
);
