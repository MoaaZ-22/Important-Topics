import 'package:animation/app/utils/generic_dialog.dart';
import 'package:flutter/material.dart' show BuildContext, Colors;

Future<bool> showUnblockAccountDialog(BuildContext context) {
  return showGenericDialog<bool>(
    buttonColors: {
      'Unblock': Colors.red,
      'cancel': Colors.white,
    },
    dialogBackgroundColor: Colors.black,
    buttonLayout: DialogButtonLayout.row,
    context: context,
    title: 'Unblock account',
    content: 'Are you sure you want to unblock your account?',
    optionsBuilder: () => {
      'Unblock': true,
      'Cancel': false,
    },
  ).then(
    (value) => value ?? false,
  );
}
