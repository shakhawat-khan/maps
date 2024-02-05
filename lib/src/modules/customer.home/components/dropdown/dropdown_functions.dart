import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/home.provider.dart';

List<DropdownMenuItem<String>> menuitems = [];

final dhaka = {
  '1': 'Gulshan',
  '2': 'Banani',
  '3': 'Mohakhali',
};

final khulna = {
  '1': 'shatkkhira',
  '2': 'Bagerhaat',
  '3': 'josshore',
};

final rajshahi = {
  '1': 'shaheb bajar',
  '2': 'dont know',
  '3': 'dont know',
};

void populateweb(WidgetRef ref) {
  for (String key in dhaka.keys) {
    menuitems.add(DropdownMenuItem<String>(
      value: dhaka[key],
      child: Center(
        child: Text(dhaka[key]!),
      ),
    ));

    ref.read(dropDownMenuItemProvider.notifier).update((state) => menuitems);

    print(menuitems);
  }
}

void populateapp(WidgetRef ref) {
  for (String key in khulna.keys) {
    menuitems.add(DropdownMenuItem<String>(
      value: khulna[key],
      child: Center(
        child: Text(khulna[key]!),
      ),
    ));
    ref.read(dropDownMenuItemProvider.notifier).update((state) => menuitems);
  }
}

void populatedesktop(WidgetRef ref) {
  for (String key in rajshahi.keys) {
    menuitems.add(DropdownMenuItem<String>(
      value: rajshahi[key],
      child: Center(
        child: Text(rajshahi[key]!),
      ),
    ));
    ref.read(dropDownMenuItemProvider.notifier).update((state) => menuitems);
  }
}

void selected(value, WidgetRef ref) {
  if (value == 'dhaka') {
    menuitems = [];
    populateweb(ref);
  } else if (value == 'khulna') {
    menuitems = [];
    populateapp(ref);
  } else if (value == 'rajshahi') {
    menuitems = [];
    populatedesktop(ref);
  }
}
