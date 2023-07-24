part of 'connectivity_cubit.dart';

@immutable
abstract class ConnectivityState {}

class ConnectivityInitial extends ConnectivityState {}

class ConnectivityHasBeenRestoredState extends ConnectivityState {}
class ConnectivityLostConnectionState extends ConnectivityState {}
