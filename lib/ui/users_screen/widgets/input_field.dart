import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  CustomText(
      {super.key,
      required this.controller,
      this.keyboardType,
      required this.label,
       this.onTap});

  final TextEditingController controller;
  TextInputType? keyboardType;
  VoidCallback? onTap;
  String label;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: onTap,
      controller: controller,
      decoration: InputDecoration(labelText: label),
      keyboardType: keyboardType,
    );
  }
}
