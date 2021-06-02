import 'package:contactlist/view/splash_page.dart';
import 'package:contactlist/utils/Messages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  @override
  Widget build(BuildContext context) {
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
    );

    _firebaseMessaging.getToken().then((String token) {
      assert(token != null);
      print('Push token gerado: $token');
    });
    //retorna GetMaterialApp para possibilitar utilizar os benefícios do Getx
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: SplashPage(), //direciona sempre para a tela de Splash
      translations: Messages(), // classe com as traduções
      locale: Get.deviceLocale, // define a tradução baseado na localização
      fallbackLocale: Locale('pt_BR', 'en_US'),
    );
  }
}
