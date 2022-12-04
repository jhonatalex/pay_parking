import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:pay_parking/dependency_injection/app_binding.dart';
import 'package:pay_parking/ui/routes/route_names.dart';
import 'package:pay_parking/ui/routes/route_pages.dart';

/*void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((value) => {runApp(const MyApp())});
}*/
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        // fontFamily: "Lato", // el tipo de fuente elegida
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue),
        /*textTheme: TextTheme(
             titleMedium: TextStyle(
              fontFamily: "raleway",
              fontSize: 16,
              // fontWeight: FontWeight.bold
            ), 
            titleLarge: TextStyle(
                fontFamily: "raleway",
                fontSize: 18,
                fontWeight: FontWeight.bold),
            bodyMedium: TextStyle(
              fontFamily: "sans",
              fontSize: 13,
            ),
          )*/
      ),

      debugShowCheckedModeBanner: false, //Quitar el banner demo
      initialBinding: const AppBinding(),
      initialRoute: RouteNames.splash,
      getPages: RoutePages.all,
    );
  }
}
