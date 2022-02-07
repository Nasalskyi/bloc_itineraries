import 'dart:convert';
import 'dart:developer';

import 'package:bloc_itineraries/data/models/itinerary.dart';
import 'package:http/http.dart' as http;

class ItineraryRepo {
  final String url = 'https://po-belu-svetu.zp.ua/wp-json/custom-routes/v1/itineraries/';

  Future<List<Itinerary>> getItinerary() async{  //getItineraryByTitle(String title)
    try{
      var response = await http.get(Uri.parse(url)); //url + '?title=$title'

      var jsonResult = json.decode(response.body);
      List<Itinerary> copyItineraries = [];
      List<WPTravelTripItineraryData> itineraryData = [];  // array of date in describing itinerary
      List<WPTravelTripItineraryData> copyItineraryData = [];  // array of date in describing itinerary
      List<Itinerary> itineraries = jsonResult.map<Itinerary>((json) => Itinerary.fromJson(json)).toList();

      for (var value in itineraries) {
        //------------------------- change dates in describing itineraries
        copyItineraryData = [];
        if(value.wpTravelTripItineraryData!.isNotEmpty){
          itineraryData = value.wpTravelTripItineraryData!;
          for (var valueItData in itineraryData){
            String date = valueItData.date;
            List<String> arrayItDate = date.split('-');
            log('$arrayItDate');
            date = '';
            for(int i=arrayItDate.length-1;i>=0;i--){
              if (i != 0 ) {
                date = date + arrayItDate[i] + '.';
              } else {
                date = date + arrayItDate[i];
              }
            }
            copyItineraryData.add(valueItData.copyWith(date: date));
          }
        }
        //----------------- deleting date in title of itinerary------
        var title = value.title.replaceAll(RegExp('[^А-Яа-яA-Za-z() ]'),'');
        //-----------------change format of dates of start and end of itinerary
        String startDate = value.wpTravelStartDate!;
        List<String> arrayStartDate = startDate.split('-');
        startDate = '';
        for(int i=arrayStartDate.length-1;i>=0;i--){
          if (i != 0 ) {
            startDate = startDate + arrayStartDate[i] + '.';
          } else {
            startDate = startDate + arrayStartDate[i];
            }
        }
        var endDate = value.wpTravelEndDate!;
        List<String> arrayEndDate = endDate.split('-');
        endDate = '';
        for(int i=arrayEndDate.length-1;i>=0;i--){
          if (i != 0 ) {
            endDate = endDate + arrayEndDate[i] + '.';
          } else {
            endDate = endDate + arrayEndDate[i];
          }
        }
        //-------------------------------------------
        //---------accept changes in new list----
        copyItineraries.add(
            value.copyWith(
                title: title,
                wpTravelStartDate: startDate,
                wpTravelEndDate: endDate,
                wpTravelTripItineraryData: copyItineraryData,
        ));
      }
      return copyItineraries;
    } catch(e){
      throw Exception(e.toString());
    }


  }
}