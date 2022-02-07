import 'dart:async';

import 'package:bloc/bloc.dart';

import 'network_event.dart';
import 'network_state.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
   Connectivity connectivity = Connectivity();
   late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  NetworkBloc() : super(NetworkLoading()) {
    monitorConnectionType();
  }

  void monitorConnectionType() async{
    _connectivitySubscription = connectivity.onConnectivityChanged.listen((connectivityResult) async {
      if(connectivityResult ==ConnectivityResult.mobile ||connectivityResult ==ConnectivityResult.wifi) {

        emit(NetworkConnected(connectionType: connectivityResult));
        //dispose();
      }
      else {
        emit(NetworkDisconnected());
      }
    });
  }

   void dispose() {
     _connectivitySubscription.cancel();
   }
}
