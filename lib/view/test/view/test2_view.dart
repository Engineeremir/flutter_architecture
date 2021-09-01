import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/base/state/base_state.dart';
import 'package:flutter_architecture/core/base/view/base_widget.dart';
import 'package:flutter_architecture/core/constants/enums/locale_keys_enum.dart';
import 'package:flutter_architecture/core/extension/string_extension.dart';
import 'package:flutter_architecture/core/init/cache/locale_manager.dart';
import 'package:flutter_architecture/core/init/language/language.dart';
import 'package:flutter_architecture/core/init/language/locale_keys.g.dart';
import 'package:flutter_architecture/view/test/viewmodel/test_view_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TestsView extends StatefulWidget {
  const TestsView({Key? key}) : super(key: key);

  @override
  _TestsViewState createState() => _TestsViewState();
}

class _TestsViewState extends BaseState<TestsView> {
  late TestViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<TestViewModel>(
        onPageBuilder: (context, value) => scaffoldBody,
        viewModel: TestViewModel(),
        onModelReady: (model) {
          viewModel = model;
        });
  }

  Widget get scaffoldBody => Scaffold(
        appBar: appBar(),
        floatingActionButton: floatingActionButtonNumberIncrement,
        body: textNumber,
      );

  AppBar appBar() {
    return AppBar(
      leading:
          Text(LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN)),
      title: textWelcomeWidget, //tr
      actions: [iconButtonIncrementNumber],
    );
  }

  Widget get textNumber {
    return Observer(
      builder: (context) => Text(
        viewModel.number.toString(),
      ),
    );
  }

  IconButton get iconButtonIncrementNumber {
    return IconButton(
        onPressed: () => context.locale = LanguageManager.instance.enLocale,
        icon: Icon(Icons.change_circle));
  }

  Text get textWelcomeWidget => Text(LocaleKeys.welcome.locale);

  FloatingActionButton get floatingActionButtonNumberIncrement =>
      FloatingActionButton(
        onPressed: () => viewModel.incrementNumber(),
      );
}

extension _FormArea on _TestsViewState {
  TextFormField get emailField => TextFormField(
        validator: (value) => value!.isValidEmail,
      );
}
