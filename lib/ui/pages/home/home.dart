import 'package:flutter/material.dart';
import 'package:pay_parking/ui/widgets/background.dart';
import 'package:pay_parking/ui/widgets/button_blue_with_icon.dart';
import 'package:pay_parking/ui/widgets/card_transparent.dart';
import 'package:pay_parking/ui/widgets/styles.dart';

class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBar = Container(
        height: 50,
        width: 280,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: [
              BoxShadow(
                color: Colors.red,
                offset: Offset(0.0, 20.0),
                blurRadius: 10.0,
                spreadRadius: 2.0,
              ),
              BoxShadow(
                color: Colors.white,
                offset: Offset(0.0, 0.0),
                blurRadius: 0.0,
                spreadRadius: 0.0,
              )
            ]),
        child: Center(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          print("Button pressed");
                        },
                        icon: Icon(Icons.menu)),
                    doSpace10,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Bienvenido",
                            style: const TextStyle(
                                fontFamily: "Lato",
                                fontSize: 16.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        Text("Jhonatan Mejias",
                            style: const TextStyle(
                                fontFamily: "Lato",
                                fontSize: 10.0,
                                color: Colors.black,
                                fontWeight: FontWeight.normal)),
                      ],
                    )
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Icon(Icons.more_vert_rounded),
                  Container(
                    height: 25,
                    child: CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/img/ParKiApp_logo.png")),
                  )
                ])
              ]),
        ));

    final funtions = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ButtonBlueWithIcon(Icons.bluetooth, "ABRIR BARRERA"),
        ButtonBlueWithIcon(Icons.local_parking, "ABRIR BARRERA"),
        ButtonBlueWithIcon(Icons.monetization_on, "RECARGA"),
        ButtonBlueWithIcon(Icons.account_balance_wallet, "BILLETERA"),
      ],
    );

    final cardTarjet = Container(
        height: 120.0,
        width: 210.0,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.only(top: 10, left: 20),
        decoration: BoxDecoration(
            color: Colors.green,
            //image: DecorationImage(fit: BoxFit.cover, image: AssetImage(pathImage)),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            //shape: BoxShape.rectangle,
            boxShadow: [
              BoxShadow(
                  color: Colors.red, offset: Offset(0.0, 5.0), blurRadius: 5.0)
            ]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Image.asset(
            "assets/img/ParKiApp_logo.png",
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
                      print("Button pressed");
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [cardTarjet])
        ]));

    final content = Center(
        child: Stack(
      children: [
        CardContainer(),
        Center(
          child: Container(
            margin: const EdgeInsets.only(top: 50.0),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                appBar,
                doSpace10,
                Container(
                  width: 280,
                  child: Text("Funciones",
                      style:
                          const TextStyle(fontFamily: "Lato", fontSize: 14.0)),
                ),
                funtions,
                doSpace10,
                tarjets
              ],
            ),
          ),
        )
      ],
    ));
    return Stack(
      children: [
        Background(),
        //GradientBack(Color(0xff426bd3), Color(0xff5d4bd1), 15),
        content
      ],
    );
  }
}
