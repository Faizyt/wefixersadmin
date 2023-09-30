import 'package:flutter/material.dart';

class CustomHeight extends StatelessWidget {
  double? height = 0;
  CustomHeight({
    super.key,this.height
  });

  @override
  Widget build(BuildContext context) {
    return height == 0
        ? const SizedBox(
      height: 5,
    )
        : SizedBox(
      height: height,
    );
  }
}