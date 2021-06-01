part of 'connection_cubit.dart';

abstract class NetConnectionState extends Equatable {
  const NetConnectionState();

  @override
  List<Object> get props => [];
}

class NetConnectionLoading extends NetConnectionState {}

class NetConnectionLoadedState extends NetConnectionState {
  final bool isConnected;

  NetConnectionLoadedState(this.isConnected);
}
