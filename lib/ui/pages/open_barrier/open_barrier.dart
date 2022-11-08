import 'package:flutter/material.dart';
import 'package:pay_parking/ui/widgets/drawer_items.dart';

import '../../widgets/app_bar.dart';

class OpenBarrier extends StatelessWidget {
  const OpenBarrier({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageBarrier = Container(
        margin: const EdgeInsets.only(top: 0),
        width: 150,
        height: 150,
        decoration: const BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.contain,
          image: AssetImage("assets/img/barrera_only.png"),
        )));

    final imageBluetooh = Container(
        margin: const EdgeInsets.only(top: 0),
        width: 200,
        height: 150,
        decoration: const BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.contain,
          image: AssetImage("assets/img/DNA.gif"),
        )));

    final textOpen = Container(
        margin: const EdgeInsets.only(top: 0),
        width: 250,
        child: Column(children: const [
          Text("Entrada",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
          Text(
              "Mantente junto al modulo emisor de tikes hasta que abra la barrera",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Divider(
            height: 15,
            thickness: 1,
            indent: 130,
            endIndent: 130,
            color: Colors.black,
          )
        ]));

    return Scaffold(
      appBar: appBar,
      backgroundColor: Colors.white,
      body: Center(
          child: Column(children: [
        imageBarrier,
        imageBluetooh,
        textOpen,
        //ButtonWithBackground("Entrar", Home())
      ])),
      drawer: Drawer(
        child: DrawerItems(),
      ),
    );
  }
}
