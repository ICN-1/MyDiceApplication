import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_dice_application/bindings/bindings.dart';
import 'package:my_dice_application/routes/routes.dart';
import 'package:my_dice_application/screens/dice_home_page.dart';

class MyDiceApplication extends StatelessWidget {
  const MyDiceApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DiceApp',
      initialBinding: MyBindings(),
      home: const DiceHomePage(),
      getPages: [
        GetPage(name: MyRoutes.diceHomePageRoute, page: ()=> const DiceHomePage())
      ],
    );
  }
}