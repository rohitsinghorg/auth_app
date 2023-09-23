import 'package:auth_app/extension/context_extension.dart';
import 'package:flutter/material.dart';

class PrimaryButtonWidget extends StatelessWidget {
  final String title;
  final Function() onTap;

  const PrimaryButtonWidget({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(99),
        ),
        backgroundColor: Colors.deepOrange,
        shadowColor: Colors.transparent,
      ),
      onPressed: onTap,
      child: Text(
        title,
        style: context.labelLarge?.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
