import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:get/get.dart';
import 'package:page_indicator/page_indicator.dart';

import '../../../app/controllers/google_controller.dart';
import '../../../domain/repositories/abstractas/responsive.dart';
import '../../routes/route_names.dart';
import '../../widgets/Background.dart';
import '../../widgets/card_transparent.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [const Background(), _IntroPager()]),
    );
  }
}

class _IntroPager extends HookWidget {
  final String slideText1 =
      'Aplicacion que te permite pagar el tickets de estacionamiento desde tu smartphone.';

  final String slideText2 =
      'Solo acerca tu smartphone o coloca el QR  y listo, sin ir a pagar a la taquilla y sin el uso del  efectivo.';

  final String slideText3 =
      'Para utilizarla, solo debes crear tu usuario, cargar tu método de pago y añadir saldo a tu billetera en la app.';

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController();
    final googleSignInController = Get.put(GoogleSignInController());

    return Obx(() {
      return AbsorbPointer(
        absorbing: googleSignInController.isLoading.value,
        child: PageIndicatorContainer(
          child: PageView(
            children: <Widget>[
              _DescriptionPage(
                textTitle: "¿Qué es PayParking?",
                text: slideText1,
                imagePath: 'assets/img/barrera-auto.png',
              ),
              _DescriptionPage(
                textTitle: "¿Cómo Funciona?",
                text: slideText2,
                imagePath: 'assets/img/EquiposParking.png',
              ),
              _DescriptionPage(
                textTitle: "¿Cómo empiezo?",
                text: slideText3,
                imagePath: 'assets/img/pago_tike.png',
              ),
              _LoginPage(),
            ],
            controller: pageController,
          ),
          align: IndicatorAlign.bottom,
          length: 4,
          indicatorSpace: 12,
          indicatorColor: Colors.grey,
          indicatorSelectorColor: Colors.black,
        ),
      );
    });
  }
}

class _DescriptionPage extends StatelessWidget {
  final String textTitle;
  final String text;
  final String imagePath;

  const _DescriptionPage({
    Key? key,
    required this.textTitle,
    required this.text,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            imagePath,
            width: sclH(context) * 40,
            height: sclH(context) * 40,
          ),
          Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(
                  textTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: sclH(context) * 4, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: sclH(context) * 2.5,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final googleSignInController = Get.find<GoogleSignInController>();

    return Container(
      padding: const EdgeInsets.all(25.0),
      margin: const EdgeInsets.only(top: 100),
      child: Stack(children: [
        const CardContainer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/img/ParKiApp_logo.png',
              width: sclH(context) * 20,
              height: sclH(context) * 20,
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  const SizedBox(height: 25),
                  Text(
                    'Bienvenido',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: sclH(context) * 3,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'puede ingresar con: ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: sclH(context) * 2,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Obx(
              () => Visibility(
                visible: googleSignInController.isLoading.value,
                child: const Center(child: CircularProgressIndicator()),
              ),
            ),
            Obx(
              () => Visibility(
                visible: googleSignInController.error.value?.isNotEmpty == true,
                child: Text(
                  googleSignInController.error.value ?? '',
                  style: const TextStyle(color: Colors.red, fontSize: 24),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: sclW(context) * 20),
              child: Column(
                children: [
                  SizedBox(height: sclH(context) * 2),
                  _LoginButton(
                    text: 'Ingresar con Email',
                    imagePath: 'assets/icon/icon_email.png',
                    color: const Color(0xFFFFDF40),
                    textColor: const Color.fromARGB(255, 85, 85, 85),
                    onTap: () => Get.offNamed(RouteNames.signIn),
                  ),
                  SizedBox(height: sclH(context) * 1),
                  _LoginButton(
                    text: 'Ingresar con Google',
                    imagePath: 'assets/icon/icon_google.png',
                    color: Colors.white,
                    textColor: const Color.fromARGB(255, 122, 122, 122),
                    onTap: () =>
                        googleSignInController.signInGoogleController(),
                  ),
                  SizedBox(height: sclH(context) * 1),
                  _LoginButton(
                    text: 'Ingresar con Facebook',
                    imagePath: 'assets/icon/icon_facebook.png',
                    color: Colors.blueAccent,
                    onTap: () => {},
                  ),
                  SizedBox(height: sclH(context) * 2),
                  Text(
                    ' o registrese aqui: ',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: sclH(context) * 2),
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 20.0),
                      width: sclW(context) * 35,
                      height: sclH(context) * 35 / 7,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(
                              color: const Color(0xFFFFDF40),
                              width: 2.0,
                              style: BorderStyle.solid),
                          color: const Color.fromARGB(76, 250, 250, 250)),
                      child: Center(
                        child: TextButton(
                            onPressed: () => Get.offNamed(RouteNames.register),
                            child: Center(
                              child: Text("Crear una cuenta",
                                  style: TextStyle(
                                      fontFamily: "Lato",
                                      fontSize: sclH(context) * 2,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                            )),
                      )),
                  /* OutlinedButton(
                    child: const Text(
                      'Crear una cuenta',
                      color
                      style: TextStyle(
                          color: Color.fromARGB(143, 12, 12, 12),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () => Get.offNamed(RouteNames.register),
                  ),*/
                  const SizedBox(height: 75),
                ],
              ),
            )
          ],
        ),
      ]),
    );
  }
}

class _LoginButton extends StatelessWidget {
  final String text;
  final String imagePath;
  final VoidCallback? onTap;
  final Color color;
  final Color textColor;

  const _LoginButton({
    Key? key,
    required this.text,
    required this.imagePath,
    this.onTap,
    this.color = Colors.blue,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      elevation: 3,
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Image.asset(
                imagePath,
                width: sclH(context) * 3,
                height: sclH(context) * 3,
              ),
              SizedBox(width: sclW(context) * 2),
              Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: sclH(context) * 2.5,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
