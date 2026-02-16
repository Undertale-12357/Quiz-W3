import 'package:flutter/material.dart';

class RideFormField extends StatelessWidget {
  final String? label, hint;
  final IconData? icon;
  final VoidCallback? onTap;

  const RideFormField({
    super.key,
    this.label,
    this.hint,
    this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextFormField(
      onTap: onTap,
      decoration: InputDecoration(labelText: label,hintText: hint , prefixIcon: Icon(icon)),
    );
  }
}
