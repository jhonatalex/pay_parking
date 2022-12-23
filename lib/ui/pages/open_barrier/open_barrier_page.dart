import 'package:flutter/material.dart';
import 'package:pay_parking/ui/pages/paid/paid_page.dart';
import 'package:pay_parking/ui/widgets/drawer_items.dart';

import '../../../domain/repositories/abstractas/responsive.dart';
import '../../routes/route_names.dart';
import '../../widgets/app_bar_back.dart';

class OpenBarrierPage extends StatelessWidget {
  const OpenBarrierPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageBarrier = Container(
        margin: const EdgeInsets.only(top: 0),
        width: sclH(context) * 20,
        height: sclH(context) * 20,
        decoration: const BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.contain,
          image: AssetImage("assets/img/barrera_only.png"),
        )));

    final imageBluetooh = Container(
        margin: const EdgeInsets.only(top: 0),
        width: sclH(context) * 25,
        height: sclH(context) * 25,
        decoration: const BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.contain,
          image: AssetImage("assets/img/DNA.gif"),
        )));

    final textOpen = Container(
        margin: const EdgeInsets.only(top: 0),
        width: sclH(context) * 60,
        child: Column(children: [
          Text("Entrada",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: sclH(context) * 4)),
          Text(
              "Mantente junto al modulo emisor de tikes hasta que abra la barrera",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: sclH(context) * 3)),
          Divider(
            height: 15,
            thickness: 1,
            indent: 130,
            endIndent: 130,
            color: Colors.black,
          )
        ]));

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(children: [
        const AppBarBack(title: "Abrir Barrera", route: RouteNames.home),
        imageBarrier,
        imageBluetooh,
        textOpen,
        Container(
          color: Colors.amber,
          width: sclW(context) * 35,
          height: sclW(context) * 25 / 2.5,
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PaidPage()));

                //Get.offNamed(RouteNames.paid);
              },
              child: Text(
                'Pago exitoso',
                style: TextStyle(fontSize: sclW(context) * 5),
              )),
        )
        //ButtonWithBackground("Entrar", Home())
      ])),
      drawer: const Drawer(
        child: DrawerItems(),
      ),
    );
  }
}
