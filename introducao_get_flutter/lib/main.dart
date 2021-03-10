import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introducao_get_flutter/pages/contato.dart';
import 'package:introducao_get_flutter/utils/messages.dart';

void main() {
  runApp(GetMaterialApp(
    translations: Messages(),
    locale: Get.deviceLocale,
    fallbackLocale: Locale('en', 'pt_BR'),
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    defaultTransition: Transition.fade,
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Apptitle'.tr),
        actions: [
          IconButton(
            onPressed: () => Get.changeTheme(
                Get.isDarkMode ? ThemeData.light() : ThemeData.dark()) ,
            icon: Icon(Icons.brightness_4),
          )
        ],
      ),
      body: Column(
        children: [
          FlatButton(
            onPressed: () {
              Get.snackbar("hello", "world",
                  snackPosition: SnackPosition.BOTTOM,
                  icon: Icon(
                    Icons.headset,
                    color: Colors.white,
                  ),
                  colorText: Colors.white,
                  backgroundColor: Colors.blue);
            },
            child: Text('Snackbar'),
          ),
          FlatButton(
            child: Text('title'.tr),
            onPressed: () {
              Get.defaultDialog(
                  confirm: IconButton(
                    onPressed: () {
                      Get.to(Contato('Adriel', 'SMO'));
                    },
                    icon: Icon(Icons.access_alarms_sharp),
                  ),
                  onWillPop: () => null,
                  barrierDismissible: false,
                  title: "Alerta",
                  content: Text('teste'),
                  actions: [
                    FlatButton(
                      child: Text('voltar'),
                      onPressed: () {
                        Get.back();
                      },
                    )
                  ]);
            },
          )
        ],
      ),
    );
  }
}
