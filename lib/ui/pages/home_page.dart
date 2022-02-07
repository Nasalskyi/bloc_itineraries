import 'package:bloc_itineraries/bloc/itinerary_bloc.dart';
import 'package:bloc_itineraries/bloc/network/network_bloc.dart';
import 'package:bloc_itineraries/ui/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:bloc_itineraries/data/repositories/itinerary_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key,required, required this.title}) : super(key: key);

  final String title;
  final repository = ItineraryRepo();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        centerTitle: true,
        title: Text(
          title,
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ItineraryBloc(itineraryRepo: repository),
            ),
          BlocProvider(
            create: (context) => NetworkBloc(),
          ),
        ],
        child: Container(
        decoration: const BoxDecoration(color: Colors.black87),
        child: SearchPage(),
        )
      ),
    );
  }
}