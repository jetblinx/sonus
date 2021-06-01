part of 'connection_cubit.dart';

@immutable
abstract class NetConnectionState {
  Object get isConnected => null;
}

class NetConnectionLoading extends NetConnectionState {}

class NetConnectionLoadedState extends NetConnectionState {
  final bool isConnected;

  NetConnectionLoadedState(this.isConnected);
}
