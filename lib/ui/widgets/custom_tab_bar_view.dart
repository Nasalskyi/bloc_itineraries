import 'package:bloc_itineraries/ui/widgets/custom_html.dart';
import 'package:flutter/material.dart';
import 'package:bloc_itineraries/data/models/itinerary.dart';

class CustomTabBarView extends StatelessWidget {
  final Itinerary itinerary;
  const CustomTabBarView({Key? key,required this.itinerary}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<WPTravelTripItineraryData>? _describedDays = [] ;
    if(itinerary.wpTravelTripItineraryData!.isNotEmpty){
      _describedDays = itinerary.wpTravelTripItineraryData;
    }

    return TabBarView(
        physics: const BouncingScrollPhysics(),
        children: [
          // first tab "Описание"
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomHtml(content: itinerary.content)
            ),
          ),
          // second tab "Маршрут"
          ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomHtml(content: itinerary.wpTravelOutline),
                  ),
                  ListView.separated(
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _describedDays!.length,
                      itemBuilder: (context,index) {
                        return Column(
                          children: [
                            Card(
                              child: SizedBox(
                                child: Center(
                                    child: Text(
                                      '${_describedDays![index].label} (${_describedDays[index].date})',
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                      ),
                                    ),
                                ),
                                height: 50,
                                width: MediaQuery.of(context).size.width,
                              ),
                              color: const Color.fromRGBO(194, 194, 194, 1),
                              elevation: 3,
                            ),
                            Card(
                                shadowColor: Colors.black,
                                color: Colors.white,
                                elevation: 10,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      const SizedBox(height: 5),
                                      Text(_describedDays[index].title, style: const TextStyle(color: Colors.black,fontSize: 20),),
                                      const SizedBox(height: 5),
                                      Text(_describedDays[index].desc, style: const TextStyle(color: Colors.black,fontSize: 18),),
                                      const SizedBox(height: 5),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        );

                      },
                      separatorBuilder: (_, index) => const SizedBox(height: 5),
                    ),
                ]
          ),
          // third tab "Включено в стоимость"
          SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomHtml(content: itinerary.wpTravelTripInclude)
            ),
          ),
          // third tab "не включено в стоимость"
          SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomHtml(content: itinerary.wpTravelTripExclude))
          ),
        ]
      );
  }
}
