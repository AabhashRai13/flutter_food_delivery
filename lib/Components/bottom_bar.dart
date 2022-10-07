import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hungerz_store/Themes/colors.dart';
import 'package:hungerz_store/Themes/style.dart';

class BottomBar extends StatelessWidget {
  final Function onTap;
  final String? text;
  final Color? color;
  final Color? textColor;

  BottomBar(
      {required this.onTap, required this.text, this.color, this.textColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap as void Function()?,
      child: Container(
        child: Center(
          child: Text(
            text!,
            style: textColor != null
                ? bottomBarTextStyle.copyWith(color: textColor)
                : bottomBarTextStyle,
          ),
        ),
        color: color ?? kMainColor,
        height: 60.0,
      ),
    );
  }
}
