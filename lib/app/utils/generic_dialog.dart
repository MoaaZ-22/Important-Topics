import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

typedef DialogOptionBuilder<T> = Map<String, T?> Function();

enum DialogButtonLayout { column, row }

Future<T?> showGenericDialog<T>({
  required BuildContext context,
  required String title,
  required String content,
  required DialogOptionBuilder optionsBuilder,
  Map<String, Color>? buttonColors, // Map for button background colors
  Map<String, Color>? buttonBorderColors, // Map for button border colors
  Color? dialogBackgroundColor,
  DialogButtonLayout buttonLayout = DialogButtonLayout.row,
}) {
  final options = optionsBuilder();
  List<Widget> buildButtons() {
    var buttonList = options.keys
        .map((optionTitle) {
          final value = options[optionTitle];
          final buttonColor =
              buttonColors?[optionTitle]; // Get specific button color
          final borderColor =
              buttonBorderColors?[optionTitle]; // Get specific border color

          return [
            Flexible(
              child: ElevatedButton(
                onPressed: () {
                  if (value != null) {
                    Navigator.of(context).pop(value);
                  } else {
                    Navigator.of(context).pop();
                  }
                },
                style: TextButton.styleFrom(
                  minimumSize: const Size(double.infinity, 55),
                  foregroundColor: Colors.white, // Text color inside the button
                  backgroundColor: buttonColor,
                  side: borderColor != null
                      ? BorderSide(color: borderColor)
                      : null,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: Text(optionTitle),
              ),
            ),
            if (optionTitle != options.keys.last)
              buttonLayout == DialogButtonLayout.row
                  ? SizedBox(width: 3.w)
                  : SizedBox(height: 1.h), // Spacing between buttons
          ];
        })
        .expand((element) => element)
        .toList();

    return buttonList;
  }

  return showDialog<T>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Center(child: Text(title)),
        content: Text(content, textAlign: TextAlign.center),
        backgroundColor: dialogBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        actions: [
          if (buttonLayout == DialogButtonLayout.row)
            Row(mainAxisSize: MainAxisSize.min, children: buildButtons())
          else
            Column(mainAxisSize: MainAxisSize.min, children: buildButtons()),
        ],
      );
    },
  );
}
