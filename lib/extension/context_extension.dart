import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  // *** Media Query ***
  // Below methods are used to make Responsive UI
  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;

  double heightPercentage(double percentage) {
    return (MediaQuery.of(this).size.height / 100) * percentage;
  }

  double widthPercentage(double percentage) {
    return (MediaQuery.of(this).size.width / 100) * percentage;
  }

  // *** Text Styles ***
  // below textStyles are as per Material 3 guidelines
  TextStyle? get displayLarge => Theme.of(this).textTheme.displayLarge;

  TextStyle? get displayMedium => Theme.of(this).textTheme.displayMedium;

  TextStyle? get displaySmall => Theme.of(this).textTheme.displaySmall;

  TextStyle? get headlineLarge => Theme.of(this).textTheme.headlineLarge;

  TextStyle? get headlineMedium => Theme.of(this).textTheme.headlineMedium;

  TextStyle? get headlineSmall => Theme.of(this).textTheme.headlineSmall;

  TextStyle? get titleLarge => Theme.of(this).textTheme.titleLarge;

  TextStyle? get titleMedium => Theme.of(this).textTheme.titleMedium;

  TextStyle? get titleSmall => Theme.of(this).textTheme.titleSmall;

  TextStyle? get bodyLarge => Theme.of(this).textTheme.bodyLarge;

  TextStyle? get bodyMedium => Theme.of(this).textTheme.bodyMedium;

  TextStyle? get bodySmall => Theme.of(this).textTheme.bodySmall;

  TextStyle? get labelLarge => Theme.of(this).textTheme.labelLarge;

  TextStyle? get labelMedium => Theme.of(this).textTheme.labelMedium;

  TextStyle? get labelSmall => Theme.of(this).textTheme.labelSmall;

  // *** Colors ***
  // below colors are as per Material 3 guidelines
  ColorScheme? get _scheme => Theme.of(this).colorScheme.copyWith(
        primary: Colors.deepOrange,
        background: Colors.white,
      );

  Color? get primaryColor => _scheme?.primary;

  Color? get backgroundColor => _scheme?.background;

  Color? get greyColor => Colors.grey;

  Color? get inputFilledColor => Colors.grey.withOpacity(0.15);

  Color? get lightTextColor => Colors.black38;
}
