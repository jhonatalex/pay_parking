import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../pages/login_main/login_main_controller.dart';

class ButtonLessBackground extends StatelessWidget {
  String textButton = "";

  ButtonLessBackground(this.textButton);

  @override
  Widget build(BuildContext context) {
    final LoginMainController controller = Get.find<LoginMainController>();

    return Container(
        margin: const EdgeInsets.only(top: 20.0),
        width: 220.0,
        height: 50.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(
                color: const Color(0xFFFFDF40),
                width: 2.0,
                style: BorderStyle.solid),
            color: const Color.fromARGB(76, 250, 250, 250)),
        child: Center(
          child: TextButton(
              onPressed: () {
                controller.goToRegister();

                /*
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => page));*/
              },
              child: Center(
                child: Text(textButton,
                    style: const TextStyle(
                        fontFamily: "Lato",
                        fontSize: 18.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
              )),
        ));
  }
}
