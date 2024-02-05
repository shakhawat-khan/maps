import 'package:flutter/material.dart'
    show BuildContext, Key, MaterialApp, Widget;
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerWidget, WidgetRef;
import 'package:pattern_m/src/modules/router/view/router.dart';

import 'package:pattern_m/src/theme/model/theme.model.dart';
import 'package:pattern_m/src/theme/provider/theme.provider.dart';

import 'constants/constants.dart';
import 'localization/loalization.dart'
    show localizationsDelegates, onGenerateTitle, supportedLocales;

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      localizationsDelegates: localizationsDelegates,
      theme: ref.watch(themeProvider).theme,
      supportedLocales: supportedLocales,
      debugShowCheckedModeBanner: false,
      onGenerateTitle: onGenerateTitle,
      restorationScopeId: appName,
      home: const AppRouter(),
    );
  }
}
