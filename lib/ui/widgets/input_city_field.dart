// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../domain/repositories/abstractas/responsive.dart';

class CityField extends StatelessWidget {
  String textButton = "";
  TextEditingController cityController;

  CityField(this.textButton, this.cityController, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
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
        controller: cityController,
        restorationId: 'city_field',
        decoration: InputDecoration(
            border: InputBorder.none,
            filled: false,
            icon: Icon(
              Icons.location_city_rounded,
              size: sclW(context) * 6,
            ),
            hintText: "Ciudad"),
      ),
    );
  }
}
