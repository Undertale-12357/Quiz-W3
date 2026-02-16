import 'package:flutter/material.dart';
import 'package:blabla/Term2/BlaBlaBus/lib/theme/theme.dart';

class BlaButton extends StatelessWidget {
  final IconData? icon;
  final String label;
  final Color color;

  const BlaButton({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return OutlinedButton.icon(
      style: OutlinedButton.styleFrom(
        backgroundColor: color == BlaColors.primary
            ? BlaColors.backGroundColor
            : BlaColors.white,
      ),
      icon: icon == null
          ? null
          : Icon(
              icon,
              color: color == BlaColors.primary
                  ? BlaColors.white
                  : BlaColors.primary,
            ),
      onPressed: () {},
      label: Text(
        label,
        style: BlaTextStyles.label.copyWith(
          color: color == BlaColors.primary
              ? BlaColors.white
              : BlaColors.primary,
        ),
      ),
    );
  }
}
