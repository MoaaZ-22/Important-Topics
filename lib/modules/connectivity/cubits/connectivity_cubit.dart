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

    // Determine initial connectivity status without emitting state.
    connectivity.checkConnectivity().then((initialResult) {
      // Set the initial connectivity status based on the current status.
      lastConnectivityStatus = (initialResult == ConnectivityResult.wifi ||
              initialResult == ConnectivityResult.mobile)
          ? ConnectivityStatus.connected
          : ConnectivityStatus.disconnected;

      // Start listening to the onConnectivityChanged stream.
      connectivityStreamSubscription = connectivity.onConnectivityChanged
          .listen((ConnectivityResult result) {
        // Check if the device is connected to either Wi-Fi or mobile data.
        final isConnected = (result == ConnectivityResult.wifi ||
            result == ConnectivityResult.mobile);

        // Only emit state if there's a change in connectivity status.
        if (isConnected !=
            (lastConnectivityStatus == ConnectivityStatus.connected)) {
          if (isConnected) {
            emit(ConnectivityHasBeenRestoredState());
          } else {
            emit(ConnectivityLostConnectionState());
          }

          // Update the last known connectivity status.
          lastConnectivityStatus = isConnected
              ? ConnectivityStatus.connected
              : ConnectivityStatus.disconnected;
        }
      });
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
