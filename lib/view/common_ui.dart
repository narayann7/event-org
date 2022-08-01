import 'package:event_org/utility/common_function.dart';
import 'package:flutter/material.dart';

myButton(
  BuildContext context, {
  String? title,
  Color? buttonColor,
  Function? function,
  double height = 20,
  double width = 20,
  double tsize = 60,
  Color? textColor,
}) {
  textColor = textColor ?? Colors.white;
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12), color: buttonColor),
    child: Center(
      child: myText(title.toString(), color: textColor, size: tsize),
    ),
  );
}
