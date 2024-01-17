import 'package:flutter/material.dart';

import '../modules/connectivity/cubits/connectivity_cubit.dart';
import '../resources/strings_manager.dart';
import 'components.dart';

void checkConnectionStateFunction(ConnectivityState state,
    GlobalKey<ScaffoldMessengerState> mainRootScaffoldMessengerKey) {
  Color snackbarColor = Colors.grey.shade800;
  if (state is ConnectivityLostConnectionState) {
    mainRootScaffoldMessengerKey.currentState!.showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: snackbarColor,
        content: const ConnectivitySnackbarContentWidget(
          displayedMessage: StringsManager.connectionLost,
          displayedIcon: Icons.wifi_off_sharp,
        )));
  } else {
    mainRootScaffoldMessengerKey.currentState!.showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: snackbarColor,
        content: const ConnectivitySnackbarContentWidget(
          displayedMessage: StringsManager.connectionRestored,
          displayedIcon: Icons.wifi,
        )));
  }
}

/// scale factor
/// responsive font size
/// (min, max) font size
double getResponsiveFontSize(BuildContext context, {required double fontSize}) {
  /// get scale factor from [getScaleFactor()] function
  double scaleFactor = getScaleFactor(context);

  /// get responsive font size by multiply [fontSize] with [scaleFactor]
  double responsiveFontSize = fontSize * scaleFactor;

  /// set [lowerLimit] value to make it less than [responsiveFontSize] by 20%
  double lowerLimit = fontSize * 0.8;

  /// set [upperLimit] value to make it greater than [responsiveFontSize] by 20%
  double upperLimit = fontSize * 1.2;

  /// use clamp to make [responsiveFontSize] between [lowerLimit] and [upperLimit]
  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

/// get scale factor
double getScaleFactor(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  if (width < 600) {
    return (width / 400);
  } else if (width < 900) {
    return (width / 700);
  } else {
    return (width / 1000);
  }
}
