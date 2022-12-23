// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_parking/app/controllers/my_user_controller.dart';
import 'package:pay_parking/ui/routes/route_names.dart';
import 'package:pay_parking/ui/widgets/button_blue_with_icon.dart';
import 'package:pay_parking/ui/widgets/drawer_items.dart';
import 'package:pay_parking/ui/widgets/styles.dart';
import 'package:pay_parking/ui/widgets/app_bar.dart';

import '../../../domain/repositories/abstractas/responsive.dart';

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
            Icons.bluetooth, "ABRIR BARRERA", RouteNames.openBarrier),
        ButtonBlueWithIcon(
            Icons.local_parking, "ESTACIONAMIENTOS", RouteNames.openBarrier),
        ButtonBlueWithIcon(
            Icons.monetization_on, "RECARGA", RouteNames.openBarrier),
        ButtonBlueWithIcon(
            Icons.account_balance_wallet, "BILLETERA", RouteNames.openBarrier)
      ],
    );

    final cardTarjet = Container(
        height: sclW(context) * 22.85,
        width: sclW(context) * 40,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
            color: Colors.green,
            gradient: GradientBlue,
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            boxShadow: const [ShadowBlueDown]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Image.asset(
            "assets/img/bancamiga_logo.png",
            width: sclW(context) * 25,
          ),
          Text("BS",
              style: TextStyle(
                  fontFamily: "Lato",
                  fontSize: sclW(context) * 3.5,
                  color: Colors.white)),
          Text("Disponible",
              style: TextStyle(
                  fontFamily: "Lato",
                  fontSize: sclW(context) * 3,
                  color: Colors.white)),
          Text("BS 0,00",
              style: TextStyle(
                  fontFamily: "Lato",
                  fontSize: sclW(context) * 3.5,
                  color: Colors.white)),
        ]));

    final tarjets = SizedBox(
        width: sclW(context) * 50,
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("Mis Tarjetas",
                style:
                    TextStyle(fontFamily: "Lato", fontSize: sclW(context) * 3)),
            Row(
              children: [
                TextButton.icon(
                    onPressed: () {},
                    icon:
                        Icon(Icons.add_circle_outline, size: sclW(context) * 3),
                    label: Text("Agregar",
                        style: TextStyle(
                            fontFamily: "Lato",
                            fontSize: sclW(context) * 3,
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

    return Scaffold(
      body: Content(funtions: funtions, tarjets: tarjets),
      /*Obx(() {
        //if (userController.isLoading.value) {
         // return const Center(child: CircularProgressIndicator());
        //}
        //return content;
      }),*/
      drawer: Drawer(
        width: sclW(context) * 60,
        child: DrawerItems(),
      ),
    );
  }
}

class Content extends StatefulWidget {
  const Content({
    Key? key,
    required this.funtions,
    required this.tarjets,
  }) : super(key: key);

  final Column funtions;
  final SizedBox tarjets;

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(111, 247, 247, 247),
      child: Center(
        child: ListView(
          children: [
            MyAppBar(),
            SizedBox(
              height: 24,
            ),
            Container(
              width: sclW(context) * 90,
              child: Column(
                children: [
                  Text(
                    "Funciones",
                    style: TextStyle(
                        fontFamily: "Lato", fontSize: sclW(context) * 3),
                  ),
                  widget.funtions,
                  doSpace10,
                  widget.tarjets
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
