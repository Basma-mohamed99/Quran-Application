import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class  NavigationTabs extends StatelessWidget {
  final String label;
  final String icon;
  const NavigationTabs({super.key,required this.label,required this.icon});

  @override
  Widget build(BuildContext context) {
    return  NavigationDestination(
      selectedIcon: SvgPicture.asset(
        icon,
        colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
      ),
      icon: SvgPicture.asset(icon),
      label: label
    );
  }
}
