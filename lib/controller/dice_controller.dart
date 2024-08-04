import 'dart:async';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:my_dice_application/utils/constants/colors.dart';
import 'package:my_dice_application/utils/constants/images.dart';
import 'package:my_dice_application/utils/constants/sizes.dart';
import 'package:my_dice_application/utils/constants/text.dart';

class DiceController extends GetxController{
  String toast = "";
  int count = 0;

  final diceListText = [
    DiceText.diceOne, 
    DiceText.diceTwo, 
    DiceText.diceThree, 
    DiceText.diceFour, 
    DiceText.diceFive, 
    DiceText.diceSix
  ];

  final diceListImage = [
    DiceImages.diceOne, 
    DiceImages.diceTwo, 
    DiceImages.diceThree, 
    DiceImages.diceFour, 
    DiceImages.diceFive, 
    DiceImages.diceSix
  ];

  final RxList<String> _randomNumberList = <String>[].obs;
  List<String> get randomNumberList => _randomNumberList;

  final RxString _diceResults = "".obs;
  String get diceResults => _diceResults.value;

  final RxString _diceImage = DiceImages.diceOne.obs;
  String get diceImage =>  _diceImage.value;

  final RxString _diceText = DiceText.diceOne.obs;
  String get diceText =>  _diceText.value;

  final RxBool _icon = true.obs;
  bool get icon => _icon.value;

  final RxString _buttonText = "ROLL".obs;
  String get buttonText =>  _buttonText.value;

  final RxInt _totalNumber = 0.obs;
  int get totalNumber => _totalNumber.value;

  int generateRandomIndex(){
    final random = Random();
    int randomIndex = random.nextInt(6);
    return randomIndex;
  }

  void setDiceResults(){
    _diceResults.value = randomNumberList.join(", ");
  }

  void getTotalRandomNumbers(diceString){
    if (randomNumberList.length < 6) {
      _randomNumberList.add(diceString);
    }

    setDiceResults();

    if (randomNumberList.length == 6) {
      for (String i in randomNumberList){
        count = count + int.parse(i);
      }
      _totalNumber.value = count;
      count = 0;
      _randomNumberList.clear();
    }else if (randomNumberList.length < 6){
      _totalNumber.value = 0;
    }
  }

  void animateDice(){
    int animationDuration = 2000;
    int animationInterval = 50;
    int elapsedTime = 0;

    Timer.periodic(Duration(milliseconds: animationInterval), (timer){
      elapsedTime += animationInterval;
      if (elapsedTime >= animationDuration) {
        _icon.value = true;
        _buttonText.value = "ROLL";
        timer.cancel();
        elapsedTime = 0;
        onRollDice();
      }else{
        _icon.value = false;
        _buttonText.value = "WAIT";
        int numIndex = generateRandomIndex();
        _diceImage.value = diceListImage[numIndex];
        _diceText.value = diceListText[numIndex];
      }
    });
  }

  void onRollDice(){
    int index = generateRandomIndex();
    _diceImage.value = diceListImage[index];
    _diceText.value = diceListText[index];
    String dice = diceListText[index];
    getTotalRandomNumbers(dice);

    showToastMessage(getToastMessage(dice));
  }

  String getToastMessage(diceNumber){
    if (int.parse(diceNumber) % 2 == 0) {
      if (int.parse(diceNumber) == 6) {
        toast = "6 has been thrown & it is an even number";
      }else {
        toast = "An even number is thrown";
      }
    }else if (int.parse(diceNumber) % 2 == 1) {
      toast = "An odd number is thrown";
    }

    return toast;
  }

  void showToastMessage(String message){
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1, 
      backgroundColor: DiceColors.primaryColor,
      textColor:  DiceColors.black,
      fontSize: DiceSizes.smallText
    );
  }
}