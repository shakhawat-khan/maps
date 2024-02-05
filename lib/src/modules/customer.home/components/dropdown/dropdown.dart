import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pattern_m/src/modules/customer.home/components/dropdown/dropdown_functions.dart';
import 'package:pattern_m/src/modules/customer.home/provider/home.provider.dart';

class DropDownTest extends ConsumerWidget {
  const DropDownTest({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // void secondselected(value) {
    //   ref.read(dropDownProvider1.notifier).update((state) => value);
    // }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          DecoratedBox(
            decoration: const ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                    width: 1.0, style: BorderStyle.solid, color: Colors.red),
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  borderRadius: BorderRadius.circular(15),
                  items: const [
                    DropdownMenuItem<String>(
                      value: 'khulna',
                      child: Center(
                        child: Text('khulna'),
                      ),
                    ),
                    DropdownMenuItem<String>(
                      value: 'dhaka',
                      child: Center(
                        child: Text('dhaka'),
                      ),
                    ),
                    DropdownMenuItem<String>(
                      value: 'rajshahi',
                      child: Center(
                        child: Text('rajshahi'),
                      ),
                    )
                  ],
                  onChanged: (value) {
                    ref
                        .read(dropDownProvider1.notifier)
                        .update((state) => value!);
                    selected(value, ref);
                    ref
                        .read(dropDownProvider2.notifier)
                        .update((state) => 'Area');
                  },
                  hint: Text(
                    ref.watch(dropDownProvider1),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          DecoratedBox(
            decoration: const ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                    width: 1.0, style: BorderStyle.solid, color: Colors.red),
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  borderRadius: BorderRadius.circular(15),
                  items: ref.watch(dropDownMenuItemProvider),
                  onChanged: (value) {
                    ref
                        .read(dropDownProvider2.notifier)
                        .update((state) => value!);
                  },
                  hint: Text(ref.watch(dropDownProvider2)),
                  //disabledHint: Text("First Select Your Field"),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const Flexible(
            child: TextField(
              decoration: InputDecoration(labelText: 'Address'),
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class NestedDropdown extends StatefulWidget {
//   @override
//   _NestedDropdownState createState() => _NestedDropdownState();
// }

// class _NestedDropdownState extends State<NestedDropdown> {
//   String? _selectedOption;
//   String? _selectedSubOption;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: <Widget>[
//           DropdownButton<String>(
//             hint: Text('Select an option'),
//             value: _selectedOption,
//             onChanged: (newValue) {
//               setState(() {
//                 _selectedOption = newValue!;
//               });
//             },
//             items: <String>['Option 1', 'Option 2', 'Option 3']
//                 .map<DropdownMenuItem<String>>((String value) {
//               return DropdownMenuItem<String>(
//                 value: value,
//                 child: Text(value),
//               );
//             }).toList(),
//           ),
//           if (_selectedOption != null)
//             DropdownButton<String>(
//               hint: Text('Select a sub-option'),
//               value: _selectedSubOption,
//               onChanged: (newValue) {
//                 setState(() {
//                   _selectedSubOption = newValue!;
//                 });
//               },
//               items: <String>['Sub-option 1', 'Sub-option 2', 'Sub-option 3']
//                   .map<DropdownMenuItem<String>>((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//             ),
//         ],
//       ),
//     );
//   }
// }
