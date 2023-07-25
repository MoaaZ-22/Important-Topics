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