import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';

import 'network_event.dart';
import 'network_state.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
   ConnectivityResult _connectivityResult = ConnectivityResult.none;
   Connectivity connectivity = Connectivity();
   late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  NetworkBloc() : super(NetworkStateLoading()) {
   on<NetworkEventTryConnect>((event, emit) => monitorConnectionType(emit));
   on<NetworkEventConnected>((event,emit)=> emit(NetworkStateConnected(connectionType: _connectivityResult)));
   on<NetworkEventDisconnected>((event,emit)=> emit(NetworkStateDisconnected()));
  }

  void monitorConnectionType(dynamic emit) {
      try{
       _connectivitySubscription =  connectivity.onConnectivityChanged.listen((connectivityResult ) {
         _connectivityResult = connectivityResult;
         if (connectivityResult == ConnectivityResult.mobile ||
             connectivityResult == ConnectivityResult.wifi) {
           log('connected');
            add(NetworkEventConnected());
         }
         else {
           log('disconnected');
           add(NetworkEventDisconnected());
         }
       });
     } catch (e) {
       emit(NetworkStateDisconnected());
       log('Error NetworkState: $e');
       rethrow;
     }
  }

   void dispose() {
     _connectivitySubscription.cancel();
   }
}
