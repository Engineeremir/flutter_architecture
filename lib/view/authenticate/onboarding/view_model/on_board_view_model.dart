import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/constants/enums/locale_keys_enum.dart';
import 'package:flutter_architecture/core/constants/navigation/navigation_constants.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/init/language/locale_keys.g.dart';
import '../../../_product/_contants/image_path_svg.dart';
import '../model/on_board_model.dart';
part 'on_board_view_model.g.dart';

class OnBoardViewModel = _OnBoardViewModelBase with _$OnBoardViewModel;

abstract class _OnBoardViewModelBase with Store, BaseViewModel {
  void setContext(BuildContext context) => this.context = context;
  List<OnBoardModel> onBoardItems = [];

  @observable
  int currentPageIndex = 0;

  @observable
  bool isLoading = false;

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  @action
  void onPageIndex(int value) {
    currentPageIndex = value;
  }

  @override
  void init() {
    onBoardItems.add(OnBoardModel(LocaleKeys.onBoard_page1_title,
        LocaleKeys.onBoard_page1_desc, ImageConstants.instance.design));

    onBoardItems.add(OnBoardModel(LocaleKeys.onBoard_page2_title,
        LocaleKeys.onBoard_page2_desc, ImageConstants.instance.cv));

    onBoardItems.add(OnBoardModel(LocaleKeys.onBoard_page3_title,
        LocaleKeys.onBoard_page3_desc, ImageConstants.instance.entries));
  }

  Future<void> completeToOnBoard() async {
    changeLoading();
    await localeManager.setBoolValue(PreferencesKeys.IS_FIRST_APP, true);
    changeLoading();
    navigation.navigateToPageClear(path: NavigationConstants.LOGIN_VIEW);
  }
}
