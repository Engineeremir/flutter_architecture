import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/components/circle_avatar/on_board_circle.dart';
import 'package:flutter_architecture/core/components/text/auto_local_text.dart';
import 'package:flutter_architecture/core/extension/context_extension.dart';

import 'package:flutter_architecture/view/authenticate/onboarding/model/on_board_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/base/view/base_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../view_model/on_board_view_model.dart';

class OnBoardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<OnBoardViewModel>(
      viewModel: OnBoardViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, OnBoardViewModel viewModel) =>
          Scaffold(
        body: Padding(
          padding: context.paddingNormalHorizontal,
          child: Column(
            children: [
              Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 5,
                child: buildPageView(viewModel),
              ),
              Expanded(flex: 2, child: buildRowFooter(viewModel, context)),
            ],
          ),
        ),
      ),
    );
  }

  Row buildRowFooter(OnBoardViewModel viewModel, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(flex: 2, child: buildListViewCircles(viewModel)),
        buildFloatingActionButtonSkip(context, viewModel)
      ],
    );
  }

  ListView buildListViewCircles(OnBoardViewModel viewModel) {
    return ListView.builder(
      itemCount: 3,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Observer(
          builder: (_) {
            return OnBoardCircle(
                isSelected: viewModel.currentPageIndex == index);
          },
        );
      },
    );
  }

  FloatingActionButton buildFloatingActionButtonSkip(
      BuildContext context, OnBoardViewModel viewModel) {
    return FloatingActionButton(
      backgroundColor: context.colors.secondaryVariant,
      child: Icon(
        Icons.keyboard_arrow_right,
        color: context.colors.primaryVariant,
      ),
      onPressed: () {
        viewModel.completeToOnBoard();
      },
    );
  }

  PageView buildPageView(OnBoardViewModel viewModel) {
    return PageView.builder(
        itemCount: viewModel.onBoardItems.length,
        onPageChanged: (value) {
          viewModel.onPageIndex(value);
        },
        itemBuilder: (context, index) =>
            buildColumnBody(context, viewModel.onBoardItems[index]));
  }

  Column buildColumnBody(BuildContext context, OnBoardModel model) {
    return Column(
      children: [
        Expanded(flex: 5, child: buildSvg(model.imagePath)),
        buildColumnDescription(context, model),
      ],
    );
  }

  Column buildColumnDescription(BuildContext context, OnBoardModel model) {
    return Column(
      children: [
        buildTextTitle(model, context),
        Padding(
          padding: context.paddingMediumHorizontal,
          child: buildTextDescription(model, context),
        ),
      ],
    );
  }

  AutoLocaleText buildTextTitle(OnBoardModel model, BuildContext context) {
    return AutoLocaleText(
      value: model.title,
      style: Theme.of(context).textTheme.headline3!.copyWith(
          fontWeight: FontWeight.bold, color: context.colors.onSecondary),
    );
  }

  AutoLocaleText buildTextDescription(
      OnBoardModel model, BuildContext context) {
    return AutoLocaleText(
      value: model.description,
      textAlign: TextAlign.center,
      style: Theme.of(context)
          .textTheme
          .subtitle1!
          .copyWith(fontWeight: FontWeight.w100),
    );
  }

  SvgPicture buildSvg(String path) => SvgPicture.asset(path);
}
