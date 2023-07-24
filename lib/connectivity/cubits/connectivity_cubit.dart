import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'connectivity_state.dart';

class ConnectivityCubit extends Cubit<ConnectivityState> {
  ConnectivityCubit() : super(ConnectivityInitial());

  final Connectivity connectivity = Connectivity();
  StreamSubscription? connectivityStreamSubscription;

  void checkConnectivity() {
    connectivityStreamSubscription?.cancel();
    connectivityStreamSubscription = connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      final isConnected = (result == ConnectivityResult.wifi || result == ConnectivityResult.mobile);
      emit(isConnected ? ConnectivityHasBeenRestoredState() : ConnectivityLostConnectionState());
    });
  }

}
