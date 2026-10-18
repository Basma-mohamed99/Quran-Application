import 'package:flutter/material.dart';

import '../../core/resources/application_colors.dart';

class DotIndicator extends StatelessWidget {
 final bool isActive;

   DotIndicator({super.key,required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4),
      width:isActive?  24: 8,
      height: 8,
      decoration: BoxDecoration(
        color: isActive ? ApplicationColors.gold : Colors.grey,
        borderRadius: BorderRadius.circular(20),

      ),
    );
  }
}
