import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'connectivity_state.dart';

enum ConnectivityStatus { connected, disconnected }

class ConnectivityCubit extends Cubit<ConnectivityState> {
  ConnectivityCubit() : super(ConnectivityInitial());

  final Connectivity connectivity = Connectivity();
  StreamSubscription? connectivityStreamSubscription;
  ConnectivityStatus lastConnectivityStatus = ConnectivityStatus.connected;

  void checkConnectivity() {
    connectivityStreamSubscription?.cancel();
    connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
          final isConnected = (result == ConnectivityResult.wifi ||
              result == ConnectivityResult.mobile);

          if (isConnected && lastConnectivityStatus == ConnectivityStatus.disconnected) {
            emit(ConnectivityHasBeenRestoredState());
          } else if (!isConnected && lastConnectivityStatus == ConnectivityStatus.connected) {
            emit(ConnectivityLostConnectionState());
          }

          lastConnectivityStatus = isConnected
              ? ConnectivityStatus.connected
              : ConnectivityStatus.disconnected;
        });
  }

  @override
  Future<void> close() {
    connectivityStreamSubscription?.cancel();
    return super.close();
  }
}
