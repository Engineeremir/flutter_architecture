import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/base/view/base_widget.dart';
import 'package:flutter_architecture/core/extension/context_extension.dart';
import 'package:flutter_architecture/view/authenticate/login/viewmodel/login_view_model.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      viewModel: LoginViewModel(),
      onModelReady: (model) {
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, LoginViewModel value) =>
          buildScaffold(context),
    );
  }

  Scaffold buildScaffold(BuildContext context) => Scaffold(
          body: ListView(
        children: [
          Container(
            height: context.height * .4,
            color: context.colors.background,
            padding: context.paddingLow,
          ),
          Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: context.lowValue, vertical: context.normalValue))
        ],
      ));
}
