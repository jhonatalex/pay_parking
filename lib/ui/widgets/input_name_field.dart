// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../domain/repositories/abstractas/responsive.dart';

class InputNameField extends StatelessWidget {
  String textButton = "";
  TextEditingController nameController;

  InputNameField(this.textButton, this.nameController, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sclW(context) * 45 / 5,
      decoration: BoxDecoration(
          //boxShadow: [ShadowBlack],
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
              color: const Color(0xFFFFDF40),
              width: 2.0,
              style: BorderStyle.solid),
          color: const Color.fromARGB(76, 250, 250, 250)),
      child: TextField(
        style: TextStyle(
          fontSize: sclW(context) * 5,
        ),
        controller: nameController,
        restorationId: 'name_field',
        decoration: InputDecoration(
            border: InputBorder.none,
            filled: false,
            icon: Icon(
              Icons.account_circle_sharp,
              size: sclW(context) * 6,
            ),
            hintText: "Nombre"),
      ),
    );
  }
}
