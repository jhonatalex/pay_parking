import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PaidPage extends StatefulWidget {
  @override
  State<PaidPage> createState() => _PaidPageState();
}

class _PaidPageState extends State<PaidPage> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generar QR'),
      ),
      body: Center(
        child: Column(
          children: [
            //desde aqui y la variable
            //  final controller = TextEditingController();
            QrImage(
              data: controller.text,
              backgroundColor: Colors.white,
              version: QrVersions.auto,
              size: 150.0,
            ),

            TextButton.icon(
              icon: Icon(
                Icons.done,
                size: 30,
              ),
              onPressed: () {
                setState(() {});
              },
              label: Text("Generar qr"),
            ),
            // y de donde tomar la data para el qr
            TextField(
                controller: controller,
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                decoration: InputDecoration(
                  hintText: "Ingrese Datos",
                  hintStyle: TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
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
