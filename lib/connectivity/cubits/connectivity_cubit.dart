import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'connectivity_state.dart';

// Step 1: Define an enumeration for connectivity status to have clear states.
enum ConnectivityStatus { connected, disconnected }

class ConnectivityCubit extends Cubit<ConnectivityState> {
  // Step 2: Initialize the cubit with the initial state (ConnectivityInitial).
  ConnectivityCubit() : super(ConnectivityInitial());

  final Connectivity connectivity = Connectivity();
  StreamSubscription? connectivityStreamSubscription;

  // Step 3: Add a variable to store the last known connectivity status.
  ConnectivityStatus lastConnectivityStatus = ConnectivityStatus.connected;

  // Step 4: This method will be used to start listening to connectivity changes.
  void checkConnectivity() {
    // Cancel the existing stream subscription if it exists to avoid multiple listeners.
    connectivityStreamSubscription?.cancel();

    // Start listening to the onConnectivityChanged stream provided by the Connectivity plugin.
    connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      // Check if the device is connected to either Wi-Fi or mobile data.
      final isConnected = (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile);

      // Step 5: Emit a state based on connectivity changes.
      // If the device is connected and was previously disconnected, emit ConnectivityHasBeenRestoredState.
      if (isConnected &&
          lastConnectivityStatus == ConnectivityStatus.disconnected) {
        emit(ConnectivityHasBeenRestoredState());
      }
      // If the device is disconnected and was previously connected, emit ConnectivityLostConnectionState.
      else if (!isConnected &&
          lastConnectivityStatus == ConnectivityStatus.connected) {
        emit(ConnectivityLostConnectionState());
      }

      // Update the last known connectivity status for the next comparison.
      lastConnectivityStatus = isConnected
          ? ConnectivityStatus.connected
          : ConnectivityStatus.disconnected;
    });
  }

  @override
  // Step 6: Override the close method to clean up resources when the cubit is closed.
  Future<void> close() {
    // Cancel the stream subscription to avoid memory leaks.
    connectivityStreamSubscription?.cancel();
    return super.close();
  }
}
