import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/extension/context_extension.dart';

class OnBoardCircle extends StatelessWidget {
  final bool isSelected;
  const OnBoardCircle({Key? key, required this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: CircleAvatar(
          radius: isSelected ? context.width * .015 : context.width * .01,
          backgroundColor:
              context.colors.onError.withOpacity(isSelected ? 1 : .2)),
    );
  }
}
