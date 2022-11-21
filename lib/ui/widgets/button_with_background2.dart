// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/login_main/login_main_controller.dart';

class ButtonWithBackground2 extends StatelessWidget {
  String textButton = "";

  ButtonWithBackground2(this.textButton, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginMainController controller = Get.find<LoginMainController>();

    return Container(
        margin: const EdgeInsets.only(top: 20.0),
        width: 220.0,
        height: 50.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: const Color(0xFFFFDF40)),
        child: Center(
          child: TextButton(
              onPressed: () {
                controller.goToLogin();
                /*Navigator.push(
                    context, MaterialPageRoute(builder: (context) => page));
                */
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
