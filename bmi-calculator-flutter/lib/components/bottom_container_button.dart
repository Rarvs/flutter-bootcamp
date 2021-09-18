import 'package:flutter/material.dart';

import '../util/constants.dart';

class BottomContainerButton extends StatelessWidget {
  BottomContainerButton({this.title, @required this.onTap});

  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          this.title,
          style: kBottomContainerTextStyle,
        ),
        color: kProjectAccentColor,
        width: double.infinity,
      ),
    );
  }
}
