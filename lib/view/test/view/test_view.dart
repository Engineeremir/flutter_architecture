import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/base/state/base_state.dart';

class TestView extends StatefulWidget {
  const TestView({Key? key}) : super(key: key);

  @override
  _TestViewState createState() => _TestViewState();
}

class _TestViewState extends BaseState<TestView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: dynamicHeight(0.1),
      width: dynamicWidth(0.2),
      color: themeData.primaryColor,
    );
  }
}
