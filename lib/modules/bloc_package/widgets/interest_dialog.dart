import 'package:animation/app/utils/generic_dialog.dart';
import 'package:flutter/material.dart' show BuildContext, Colors;

Future<bool> showInterestAccountDialog(BuildContext context) {
  return showGenericDialog<bool>(
    buttonColors: {
      'Show Interest': Colors.red,
    },
    dialogBackgroundColor: Colors.black,
    buttonLayout: DialogButtonLayout.column,
    context: context,
    title: 'Show Interest',
    content: 'Are you sure you want to Show Interest to  this account?',
    optionsBuilder: () => {
      'Show Interest': true,
    },
  ).then(
    (value) => value ?? false,
  );
}
