import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class BaseView<T extends Store> extends StatefulWidget {
  final Widget Function(BuildContext context, T value) onPageBuilder;
  final T viewModel;
  final Function(T model) onModelReady;


  const BaseView(
      {Key? key,
      required this.onPageBuilder,
      required this.viewModel,
      required this.onModelReady,
      })
      : super(key: key);

  @override
  _BaseViewState createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.onModelReady != null) widget.onModelReady(widget.viewModel);
  }


  @override
  Widget build(BuildContext context) {
    return widget.onPageBuilder(context, widget.viewModel);
  }
}
