import 'package:flutter/material.dart';
import 'package:my_dice_application/utils/constants/colors.dart';
import 'package:my_dice_application/utils/constants/sizes.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key, 
    required this.buttonTxt, 
    this.onPressed, 
    required this.textColor, 
    required this.backgroundColor, 
    required this.top, 
    required this.left, 
    required this.bottom, 
    required this.right, 
    required this.image, 
  });

  final double top, left, bottom, right;
  final String buttonTxt, image;
  final Color textColor, backgroundColor; 
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: DiceColors.primaryColor,
        ),
        child: Padding(
          padding: EdgeInsets.only(top: top, right: right, left: left, bottom: bottom),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 2.0),
                child: Image(
                  image: AssetImage(
                    image,
                  ),
                  width: 30.0,
                  height: 30.0
                ),
              ),
          
              Text(
                buttonTxt,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: DiceSizes.smallText
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}