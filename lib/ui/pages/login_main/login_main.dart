import 'package:flutter/material.dart';
import 'package:pay_parking/ui/pages/login/login.dart';
import 'package:pay_parking/ui/widgets/Background.dart';
import 'package:pay_parking/ui/widgets/button_less_background.dart';
import 'package:pay_parking/ui/widgets/button_with_background.dart';
import 'package:pay_parking/ui/widgets/card_transparent.dart';
import '../../widgets/button_with_background.dart';
import '../../widgets/gradient_back.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../register/register.dart';

class LoginMain extends StatelessWidget {
  const LoginMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logo = Container(
        width: 200,
        height: 200,
        decoration: const BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.contain,
          image: AssetImage("assets/img/ParKiApp_logo.png"),
        )));

    final logo_rss = Container(
        padding: EdgeInsets.only(top: 8.0),
        width: 150,
        child: Row(children: [
          Container(
            width: 37,
            height: 37,
            margin: EdgeInsets.only(right: 10.0),
            color: Color.fromARGB(255, 80, 80, 80),
            child: IconButton(
              color: Colors.white,
              icon: Icon(FontAwesomeIcons.google),
              onPressed: () {},
            ),
          ),
          SignInButton(Buttons.Facebook, mini: true, onPressed: () {}),
          SignInButton(Buttons.Email, mini: true, onPressed: () {})
        ]));

    final card_login = Center(
        child: Stack(
      children: [
        CardContainer(),
        Container(
          margin: const EdgeInsets.only(top: 50.0),
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Flexible(child: logo),
                  ButtonWithBackground("Ingresar", Login()),
                  ButtonLessBackground("Crear Cuenta", Register()),
                  Container(
                    margin: EdgeInsets.only(top: 15.0),
                    child: const Text("___________ O ingrese con __________",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                            fontFamily: "Lato",
                            fontWeight: FontWeight.bold)),
                  ),
                  logo_rss
                ]),
          ),
        )
      ],
    ));

    return Stack(
      children: [Background(), card_login],
    );
  }
}
