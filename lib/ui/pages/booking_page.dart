import 'package:bloc_itineraries/bloc/booking/booking_bloc.dart';
import 'package:bloc_itineraries/bloc/booking/booking_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bloc_itineraries/data/models/itinerary.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingPage extends StatelessWidget {
  Itinerary itinerary;
  BookingPage({Key? key, required this.itinerary}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => BookingBloc()..add(InitEvent()),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final bloc = BlocProvider.of<BookingBloc>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        centerTitle: true,
        title: Text(
          itinerary.title,
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Введите Ваши фамилию имя',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Введите Ваш почтовый ящик',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Введите количество людей',
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: SizedBox(
                height: 55,
                width: MediaQuery.of(context).size.width,
                child: GestureDetector(
                  onTap: (){

                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: const DecoratedBox(
                        child: Center(child: Text('Забронировать')),
                        decoration: BoxDecoration(color: Colors.green)
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
