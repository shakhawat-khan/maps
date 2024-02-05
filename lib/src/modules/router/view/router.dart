import 'package:flutter/material.dart'
    show
        AppBar,
        BuildContext,
        Center,
        Column,
        CrossAxisAlignment,
        ElevatedButton,
        Key,
        MainAxisAlignment,
        MaterialPageRoute,
        MediaQuery,
        Navigator,
        Scaffold,
        Text,
        Widget;

import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerWidget, WidgetRef;
import 'package:pattern_m/src/localization/loalization.dart';
import 'package:pattern_m/src/modules/ScreenSize/small_screen.dart';
import 'package:pattern_m/src/modules/deliveryman.home/view/home.view.dart';

import '../../customer.home/view/home.view.dart' show HomeView;

class AppRouter extends ConsumerWidget {
  const AppRouter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    t = AppLocalizations.of(context);
    final temp = MediaQuery.of(context).size.width;

    return temp > 350
        ? Scaffold(
            appBar: AppBar(
              title: const Text('hello'),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeView()),
                      );
                    },
                    child: const Text('press for User home'),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DeliveryManHomeView(),
                      ),
                    );
                  },
                  child: const Text('press for Delivery Man home'),
                )
              ],
            ))
        : const SmallScreenSize();
  }
}
