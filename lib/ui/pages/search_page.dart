
import 'dart:developer';
import 'package:bloc_itineraries/bloc/itinerary_bloc.dart';
import 'package:bloc_itineraries/bloc/network/network_bloc.dart';
import 'package:bloc_itineraries/bloc/network/network_event.dart';
import 'package:bloc_itineraries/bloc/network/network_state.dart';
import 'package:bloc_itineraries/ui/pages/itinerary_page.dart';
import 'package:bloc_itineraries/ui/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_itineraries/data/models/itinerary.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
//import 'package:connectivity_plus/connectivity_plus.dart';
//now disabled because of idle backend with searching  Title
class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  List<Itinerary> _currentItineraries = [];
  final refreshController = RefreshController();
  bool _isRefreshing = false;
  
  final _storage = HydratedBlocOverrides.current?.storage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    log('my storage: ${_storage.runtimeType.toString()}');
    log('Itineraries:$_currentItineraries');
    context.read<NetworkBloc>()
        .add(NetworkEventTryConnect());
  }
  @override
  Widget build(BuildContext context) {

    final state = context.watch<ItineraryBloc>().state;
    final networkState = context.watch<NetworkBloc>().state;
    log('my connection: $networkState');
  //  log('my connection: ${_connectionStatus.toString()}');
    if (networkState is NetworkStateConnected) {
      if(_currentItineraries.isEmpty) {
        log('lets update itineraries');
        context.read<ItineraryBloc>()
          .add(const ItineraryEventFetch());
      } else {
        log('itineraries are not empty');
      }

    }
    return Column(
      children:[
        //I had problem with custom API, that why i disable search field
        /*TextField(
          onChanged: (value) {
            context.read<ItineraryBloc>().add(ItineraryEvent.fetch()); // title: value
          },
          style: const TextStyle(color: Colors.white),
          cursorColor: Colors.white,
          decoration:  InputDecoration(
            filled: true,
            fillColor: const Color.fromRGBO(86, 86, 86, 0.8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none
            ),
            prefixIcon: const Icon(Icons.search, color: Colors.white),
            hintText: 'Поиск по названию',
            hintStyle: const TextStyle(color: Colors.white)
          ),

        ),*/
        Expanded(
            child: state.when(
            loading: (){
              if(!_isRefreshing) {
                return Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircularProgressIndicator(strokeWidth: 2,),
                        SizedBox(width: 10),
                        Text('Загрузка...')
                      ],
                    )
                );
              } else {
                return _customListView(_currentItineraries);
              }

            },
            loaded: (itineraryLoaded) {
              _currentItineraries = itineraryLoaded;
              if(_isRefreshing) {
                _isRefreshing = false;
                _currentItineraries.addAll(_currentItineraries);
                refreshController.loadComplete();

              } else {

              }
              return _currentItineraries.isNotEmpty
                  ?_customListView(_currentItineraries)
                  : const SizedBox();
            },
            error: () {
              _currentItineraries = [];
              return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Center(
                      child: Text('Проверьте интернет соединение!')
                  )
              );
            }
            )
        )
    ]);
  }
  Widget _customListView(List<Itinerary> currentItineraries){
    return SmartRefresher(
      controller: refreshController,
      enablePullUp: false,
      enablePullDown: true,

      onRefresh: (){
        context.read<ItineraryBloc>().add(const ItineraryEvent.fetch());
      },
      child: ListView.separated(
          itemBuilder: (context,index) {
            final itinerary = currentItineraries[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ItineraryPage(itinerary: currentItineraries[index])
                    )
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(right:  16, left: 16, top: 3, bottom: 3),
                child: CustomListTile(itinerary: itinerary)
              ),
            );
          },
          separatorBuilder: (_, index) => const SizedBox(height: 5),
          itemCount: currentItineraries.length)
    );
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  // Future<void> initConnectivity() async {
  //   late ConnectivityResult result;
  //   // Platform messages may fail, so we use a try/catch PlatformException.
  //   try {
  //     result = await _connectivity.checkConnectivity();
  //   } on PlatformException catch (e) {
  //     log('Couldn\'t check connectivity status', error: e);
  //     return;
  //   }
  //
  //   // If the widget was removed from the tree while the asynchronous platform
  //   // message was in flight, we want to discard the reply rather than calling
  //   // setState to update our non-existent appearance.
  //   if (!mounted) {
  //     return Future.value(null);
  //   }
  //
  //   return _updateConnectionStatus(result);
  // }

  // Future<void> _updateConnectionStatus(ConnectivityResult result) async {
  //   setState(() {
  //     _connectionStatus = result;
  //   });
  // }
  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   _connectivitySubscription.cancel();
  //   super.dispose();
  // }
}
