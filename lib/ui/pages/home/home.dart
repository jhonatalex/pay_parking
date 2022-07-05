import 'package:flutter/material.dart';
import 'package:pay_parking/ui/widgets/background.dart';
import 'package:pay_parking/ui/widgets/button_blue_with_icon.dart';
import 'package:pay_parking/ui/widgets/card_transparent.dart';
import 'package:pay_parking/ui/widgets/drawer_items.dart';
import 'package:pay_parking/ui/widgets/styles.dart';
import 'package:pay_parking/ui/widgets/app_bar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final funtions = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ButtonBlueWithIcon(
            Icons.bluetooth, "ABRIR BARRERA", GradientBlue, Colors.blue),
        ButtonBlueWithIcon(
            Icons.local_parking, "ABRIR BARRERA", GradientBlue, Colors.blue),
        ButtonBlueWithIcon(
            Icons.monetization_on, "RECARGA", GradientBlue, Colors.blue),
        ButtonBlueWithIcon(Icons.account_balance_wallet, "BILLETERA",
            GradientBlue, Colors.blue),
      ],
    );

    final cardTarjet = Container(
        height: 120.0,
        width: 210.0,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.only(top: 10, left: 20),
        decoration: BoxDecoration(
            color: Colors.green,
            gradient: GradientBlue,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            boxShadow: [ShadowBlueDown]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Image.asset(
            "assets/img/bancamiga_logo.png",
            height: 40,
          ),
          doSpace20,
          Text("BS",
              style: const TextStyle(
                  fontFamily: "Lato", fontSize: 12.0, color: Colors.white)),
          Text("Disponible",
              style: const TextStyle(
                  fontFamily: "Lato", fontSize: 10.0, color: Colors.white)),
          Text("BS 0,00",
              style: const TextStyle(
                  fontFamily: "Lato", fontSize: 14.0, color: Colors.white)),
        ]));

    final tarjets = Container(
        width: 280,
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("Mis Tarjetas",
                style: const TextStyle(fontFamily: "Lato", fontSize: 14.0)),
            Row(
              children: [
                TextButton.icon(
                    onPressed: () {
                      print("Button add tarjet pressed");
                    },
                    icon: Icon(Icons.add_circle_outline, size: 16),
                    label: Text("Agregar",
                        style: const TextStyle(
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
      color: Color.fromARGB(111, 247, 247, 247),
      child: Center(
        child: Column(
          children: [
            doSpace10,
            Container(
              width: 280,
              child: Text("Funciones",
                  style: const TextStyle(fontFamily: "Lato", fontSize: 14.0)),
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
      drawer: Drawer(
        child: DrawerItems(),
      ),
    );
  }
}
