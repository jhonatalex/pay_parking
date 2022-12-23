import 'package:flutter/material.dart';
import 'package:pay_parking/ui/widgets/app_bar_back.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../domain/repositories/abstractas/responsive.dart';
import '../../routes/route_names.dart';

class PaidPage extends StatefulWidget {
  const PaidPage({Key? key}) : super(key: key);

  @override
  State<PaidPage> createState() => _PaidPageState();
}

class _PaidPageState extends State<PaidPage> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const AppBarBack(
                title: "Generar QR", route: RouteNames.openBarrier),

            //desde aqui y la variable
            //  final controller = TextEditingController();
            QrImage(
              data: controller.text,
              backgroundColor: Colors.white,
              version: QrVersions.auto,
              size: sclH(context) * 25,
            ),

            TextButton.icon(
              icon: Icon(
                Icons.done,
                size: sclH(context) * 4,
              ),
              onPressed: () {
                setState(() {});
              },
              label: Text(
                "Generar qr",
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: sclH(context) * 3),
              ),
            ),
            // y de donde tomar la data para el qr
            TextField(
                controller: controller,
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: sclH(context) * 3),
                decoration: InputDecoration(
                  hintText: "Ingrese Datos",
                  hintStyle: const TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.blue),
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.done,
                      size: 30,
                    ),
                    onPressed: () {
                      setState(() {});
                    },
                  ),
                )),
            //hasta aqui
          ],
        ),
      ),
    );
  }
}
