import 'package:flutter/material.dart';
import 'package:pay_parking/ui/pages/home/home.dart';
import 'package:pay_parking/ui/pages/login/login.dart';
import 'package:pay_parking/ui/pages/login_main/login_main.dart';
import 'package:pay_parking/ui/widgets/app_bar.dart';
import 'package:pay_parking/ui/widgets/styles.dart';

class DrawerItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final drawerHeader = Stack(
      children: [
        InkWell(
            onTap: () {
              /* Navigator.pop(context); para cerrar menu
          Navigator.of(context)
              .push(MaterialPageRoute(builder: ((context) => const Login())));
        */
              print("Ir a perfil");
            },
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(gradient: GradientBlue),
              padding: EdgeInsets.all(30),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                        radius: 45,
                        backgroundImage:
                            AssetImage("assets/img/jhonatan_mejias.jpg")),
                    Text("Jhonatan Mejias",
                        style: const TextStyle(
                            fontFamily: "Lato",
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    Text("jhonathan@gmail.com",
                        style: const TextStyle(
                            fontFamily: "Lato",
                            fontSize: 14.0,
                            color: Colors.black)),
                  ]),
            )),
        IconButton(
          onPressed: () {
            Navigator.pop(context);
            print("menu closed");
          },
          icon: Icon(Icons.cancel_outlined),
          color: Colors.red,
        )
      ],
    );

    final drawerItems = ListView(
      children: [
        drawerHeader,
        ListTile(
          title: Text(
            "Home",
          ),
          leading: const Icon(Icons.home, color: Colors.red),
          trailing: const Icon(Icons.keyboard_arrow_left, color: Colors.red),
          onTap: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: ((context) => const Home())));
          },
        ),
        ListTile(
          title: Text(
            "Login",
          ),
          leading: const Icon(Icons.login, color: Colors.blue),
          trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.blue),
          onTap: () {
            //Navigator.pop(context); para cerrar menu
            Navigator.of(context)
                .push(MaterialPageRoute(builder: ((context) => const Login())));
          },
        ),
        ListTile(
          title: Text(
            "Login Main",
          ),
          leading: const Icon(Icons.login, color: Colors.blue),
          trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.blue),
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: ((context) => const LoginMain())));
          },
        ),
        ListTile(
          title: Text(
            "Movimientos",
          ),
          leading: const Icon(Icons.comment, color: Colors.blue),
          trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.blue),
          onTap: () {},
        ),
        ListTile(
          title: Text(
            "Depositar",
          ),
          leading: const Icon(Icons.comment, color: Colors.blue),
          trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.blue),
          onTap: () {},
        ),
        ListTile(
          title: Text(
            "Comercio",
          ),
          leading: const Icon(Icons.comment, color: Colors.blue),
          trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.blue),
          onTap: () {},
        ),
        ListTile(
          title: Text(
            "Soporte",
          ),
          leading: const Icon(Icons.support_agent, color: Colors.blue),
          trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.blue),
          onTap: () {},
        ),
        Divider(
          indent: 0,
          endIndent: 0,
          color: Colors.black38,
        ),
        ListTile(
          title: Text(
            "Ajustes",
          ),
          leading: const Icon(Icons.miscellaneous_services, color: Colors.blue),
          trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.blue),
          onTap: () {},
        ),
      ],
    );
    return drawerItems;
  }
}
