import 'package:animation/app/components.dart';
import 'package:animation/generated/l10n.dart';
import 'package:animation/resources/routes_manager.dart';
import 'package:flutter/material.dart';

class BlocView extends StatelessWidget {
  const BlocView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc View'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemBuilder: (context, index) => CustomButton(
          buttonText: chooseRouteAndTitleFun(index: index, context: context).$1,
          routesName: chooseRouteAndTitleFun(index: index, context: context).$2,
        ),
        itemCount: 3,
      ),
    );
  }
}

(String buttonText, String routeName) chooseRouteAndTitleFun(
    {required int index, required BuildContext context}) {
  switch (index) {
    case 0:
      return (S.of(context).loginBlocView, Routes.authBLocView);

    case 1:
      return (S.of(context).genericDialog, Routes.genericDialog);

    case 2:
      return (S.of(context).searchWithBloc, Routes.searchWithBlocConcurrency);
    default:
      return ('', '');
  }
}
