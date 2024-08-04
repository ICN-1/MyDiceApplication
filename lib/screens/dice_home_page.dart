import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_dice_application/controller/dice_controller.dart';
import 'package:my_dice_application/utils/constants/colors.dart';
import 'package:my_dice_application/utils/constants/images.dart';
import 'package:my_dice_application/utils/constants/sizes.dart';
import 'package:my_dice_application/utils/constants/text.dart';
import 'package:my_dice_application/utils/devices/device.dart';
import 'package:my_dice_application/widgets/button.dart';
import 'package:my_dice_application/widgets/image.dart';

class DiceHomePage extends StatelessWidget {
  const DiceHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    DiceController diceController = Get.put(DiceController());

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: DiceDevice.getStatusBarHeight(context) + 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  DiceText.appName,
                  style: TextStyle(
                    fontSize: DiceSizes.veryLargeText,
                    color: DiceColors.black,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
        
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 200.0),
                child: Column(
                  children: [
                    Obx(() => MyImage(
                      image: diceController.diceImage, 
                      height: 150.0,
                      width: 150.0,
                    )),

                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Obx(() =>Text(
                        "Dice: ${diceController.diceText}",
                        style: const TextStyle(
                          fontSize: DiceSizes.normalText,
                          color: DiceColors.black,
                          fontWeight: FontWeight.bold
                        ),
                      )),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: Obx(() => MyButton(
                        onPressed: diceController.animateDice,
                        buttonTxt: diceController.buttonText,
                        textColor: DiceColors.black,
                        backgroundColor: DiceColors.primaryColor,
                        top: 10,
                        bottom: 10,
                        left: 40,
                        right: 40,
                        image: diceController.icon == true ? DiceImages.diceIcon : DiceImages.loadingIcon,
                      )),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Obx(() => Text(
                        "Dice Results: ${diceController.diceResults}",
                        style: const TextStyle(
                          fontSize: DiceSizes.normalText,
                          color: DiceColors.black,
                          fontWeight: FontWeight.bold
                        ),
                      )),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: Obx(() => Text(
                        "Dice Sum: ${diceController.totalNumber}",
                        style: const TextStyle(
                          fontSize: DiceSizes.normalText,
                          color: DiceColors.black,
                          fontWeight: FontWeight.bold
                        ),
                      )),
                    )
                  ],
                ),
              ),
            ),
          ]  
        ),
      ),
    );
  }
}