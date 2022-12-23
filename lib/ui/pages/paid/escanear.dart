import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScanPage extends StatefulWidget {
  const QrScanPage({Key? key}) : super(key: key);

  @override
  State<QrScanPage> createState() => _QrScanPageState();
}

class _QrScanPageState extends State<QrScanPage> {
  final qrKey = GlobalKey(debugLabel: 'QR');

  QRViewController? controller;

  Barcode? barcode;

  @override
  void dispose() {
    controller?.dispose();

    super.dispose();
  }

  @override
  Future<void> reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(alignment: Alignment.center, children: [
        buildQrView(context),
        Positioned(bottom: 10, child: buildResult()),
        Positioned(top: 10, child: buildControlButtons()),
      ]),
    );
  }

  Widget buildControlButtons() => Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.white24, borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButton(
              onPressed: () async {
                await controller?.toggleFlash();
                setState(() {});
              },
              icon: FutureBuilder(
                future: controller?.getFlashStatus(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data != null) {
                    return Icon(
                        snapshot.data! ? Icons.flash_on : Icons.flash_off);
                  } else {
                    return Container();
                  }
                },
              ),
              color: Colors.white,
            ),
            IconButton(
              onPressed: () async {
                await controller?.flipCamera();
                setState(() {});
              },
              icon: FutureBuilder(
                future: controller?.getCameraInfo(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data != null) {
                    return const Icon(Icons.switch_camera);
                  } else {
                    return Container();
                  }
                },
              ),
              color: Colors.white,
            ),
          ],
        ),
      );
  Widget buildResult() => Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white24, borderRadius: BorderRadius.circular(8)),
        child: Text(
          barcode != null ? 'Result : ${barcode!.code}' : 'Scan a code!',
          maxLines: 3,
          style: const TextStyle(color: Colors.white),
        ),
      );
  Widget buildQrView(BuildContext context) => QRView(
        key: qrKey,
        onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(
            cutOutSize: MediaQuery.of(context).size.width * 0.8,
            borderRadius: 10,
            borderColor: Theme.of(context).accentColor,
            borderLength: 20,
            borderWidth: 10),
      );

  void onQRViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);

    controller.scannedDataStream
        .listen((barcode) => setState(() => this.barcode = barcode));
  }
}
