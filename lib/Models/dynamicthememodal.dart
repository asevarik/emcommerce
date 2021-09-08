import 'package:flutter/material.dart';

class DynamicThememodal {
  final IconData icon;
  final String themetitle;

  DynamicThememodal(this.icon, this.themetitle);
}

List<DynamicThememodal> themes = [
  DynamicThememodal(Icons.ac_unit, "Ambient grey"),
  DynamicThememodal(Icons.three_p, "Enviourmental Green"),
  // DynamicThememodal(Icons.fireplace, "Flaming Fire"),
  DynamicThememodal(Icons.person, "Dora the Explora"),
];
