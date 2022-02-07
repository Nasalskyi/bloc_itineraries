import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkState {

}

class NetworkLoading extends NetworkState {

}

class NetworkConnected extends NetworkState {
  final ConnectivityResult connectionType;
  NetworkConnected({required this.connectionType});
}

class NetworkDisconnected extends NetworkState {}