import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String buttonText;
  final void Function() buttonAction;
  const CustomCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.buttonText,
    required this.buttonAction,
  });

  @override
  Widget build(BuildContext context) {
    return GFCard(
      color: Theme.of(context).colorScheme.primary,
      height: MediaQuery.of(context).size.height * 0.26,
      title: GFListTile(
        title: Text(title,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        subTitleText: subTitle,
      ),
      content: GFButton(
        type: GFButtonType.outline,
        shape: GFButtonShape.pills,
        color: Colors.white,
        onPressed: buttonAction,
        text: buttonText,
      ),
    );
  }
}
