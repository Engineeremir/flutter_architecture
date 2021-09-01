import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/init/cache/locale_manager.dart';
import 'package:provider/provider.dart';

import 'core/constants/app/app_constants.dart';
import 'core/init/language/language.dart';
import 'core/init/navigation/navigation_route.dart';
import 'core/init/navigation/navigation_service.dart';
import 'core/init/notifier/provider_list.dart';
import 'core/init/notifier/theme_notifier.dart';
import 'view/test/view/test2_view.dart';

void main() {
  LocaleManager.preferencesInit();
  runApp(MultiProvider(
    providers: [...ApplicationProvider.instance.dependItems],
    child: EasyLocalization(
      child: MyApp(),
      supportedLocales: LanguageManager.instance.supportedLocales,
      path: ApplicationConstants.LANG_ASSET_PATH,
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TestsView(),
      theme: Provider.of<ThemeNotifier>(context, listen: false).currentTheme,
      navigatorKey: NavigationService.instance.navigatorKey,
      onGenerateRoute: NavigationRoute.instance.generateRoute,
    );
  }
}
