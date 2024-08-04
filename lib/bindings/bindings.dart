import 'package:get/get.dart';
import 'package:my_dice_application/controller/dice_controller.dart';

class MyBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => DiceController());
  }
  
}