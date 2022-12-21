// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_parking/app/controllers/my_user_controller.dart';
import 'package:pay_parking/ui/pages/open_barrier/open_barrier_page.dart';
import 'package:pay_parking/ui/routes/route_names.dart';
import 'package:pay_parking/ui/widgets/button_blue_with_icon.dart';
import 'package:pay_parking/ui/widgets/drawer_items.dart';
import 'package:pay_parking/ui/widgets/styles.dart';
import 'package:pay_parking/ui/widgets/app_bar.dart';

import '../../../app/controllers/auth_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final userController = Get.put(MyUserController());

    final funtions = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ButtonBlueWithIcon(
            Icons.bluetooth, "ABRIR BARRERA", const OpenBarrierPage()),
        ButtonBlueWithIcon(
            Icons.local_parking, "ESTACIONAMIENTOS", const OpenBarrierPage()),
        ButtonBlueWithIcon(
            Icons.monetization_on, "RECARGA", const OpenBarrierPage()),
        ButtonBlueWithIcon(
            Icons.account_balance_wallet, "BILLETERA", const OpenBarrierPage())
      ],
    );

    final cardTarjet = Container(
        height: 120.0,
        width: 210.0,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.only(top: 10, left: 20),
        decoration: BoxDecoration(
            color: Colors.green,
            gradient: GradientBlue,
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            boxShadow: const [ShadowBlueDown]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Image.asset(
            "assets/img/bancamiga_logo.png",
            height: 40,
          ),
          doSpace20,
          const Text("BS",
              style: TextStyle(
                  fontFamily: "Lato", fontSize: 12.0, color: Colors.white)),
          const Text("Disponible",
              style: TextStyle(
                  fontFamily: "Lato", fontSize: 10.0, color: Colors.white)),
          const Text("BS 0,00",
              style: TextStyle(
                  fontFamily: "Lato", fontSize: 14.0, color: Colors.white)),
        ]));

    final tarjets = SizedBox(
        width: 280,
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Text("Mis Tarjetas",
                style: TextStyle(fontFamily: "Lato", fontSize: 14.0)),
            Row(
              children: [
                TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add_circle_outline, size: 16),
                    label: const Text("Agregar",
                        style: TextStyle(
                            fontFamily: "Lato",
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold)))
              ],
            ),
          ]),
          Row(
              //disminuir el tamaño para que quepan dos
              //con un listview se puede hacer scroll horizontal
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [cardTarjet])
        ]));

    final content = Container(
      color: const Color.fromARGB(111, 247, 247, 247),
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 24,
            ),
            SizedBox(
              width: 280,
              child: const Text("Funciones",
                  style: TextStyle(fontFamily: "Lato", fontSize: 14.0)),
            ),
            funtions,
            doSpace10,
            tarjets
          ],
        ),
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: content,
      /*Obx(() {
        //if (userController.isLoading.value) {
         // return const Center(child: CircularProgressIndicator());
        //}
        //return content;
      }),*/
      drawer: Drawer(
        child: DrawerItems(),
      ),
    );
  }
}
