import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

abstract class NetworkState {

}
 class NetworkStateLoading extends NetworkState {
}

class NetworkStateConnected extends NetworkState {
  final ConnectivityResult connectionType;
  NetworkStateConnected({required this.connectionType});
}

class NetworkStateDisconnected extends NetworkState {


}