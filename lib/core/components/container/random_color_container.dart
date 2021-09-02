import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/extension/context_extension.dart';

class RandomColorContainer extends StatelessWidget {
  const RandomColorContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.randomColor,
    );
  }
}
