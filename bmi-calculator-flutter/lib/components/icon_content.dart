import 'package:flutter/material.dart';

import '../util/constants.dart';

class IconContent extends StatelessWidget {
  IconContent({@required this.icon, this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          this.icon,
          size: kIconSize,
        ),
        SizedBox(height: 16.0),
        Text(
          this.label,
          style: kCardLabelStyle,
        )
      ],
    );
  }
}
