import 'package:animation/app/components.dart';
import 'package:animation/generated/l10n.dart';
import 'package:animation/modules/bloc_package/widgets/unblock_dialog.dart';
import 'package:flutter/material.dart';

class GenericDialogView extends StatelessWidget {
  const GenericDialogView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).genericDialogView),
        ),
        body: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          separatorBuilder: (context, index) => const SizedBox(height: 20),
          itemBuilder: (context, index) => CustomButtonWithFunc(
            buttonText:
                chooseRouteAndTitleFun(index: index, context: context).$1,
            buttonFunc:
                chooseRouteAndTitleFun(index: index, context: context).$2,
          ),
          itemCount: 2,
        ));
  }
}

(String buttonText, void Function()? buttonFunc) chooseRouteAndTitleFun(
    {required int index, required BuildContext context}) {
  switch (index) {
    case 0:
      return (
        S.of(context).unblockDialog,
        () async {
          // showInterestAccountDialog(context); single button dialog
          final result = await showUnblockAccountDialog(
              context); // two buttons dialog as column or row
          print(result);
        }
      );

    case 1:
      return (S.of(context).interestDialog, () {});
    default:
      return ('', () {});
  }
}
