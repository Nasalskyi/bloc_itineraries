import 'package:bloc_itineraries/ui/widgets/date_of_travel_text.dart';
import 'package:flutter/material.dart';
import 'package:bloc_itineraries/data/models/itinerary.dart';
import 'package:share/share.dart';

class CustomSliverAppBar extends SliverPersistentHeaderDelegate {
  final Itinerary itinerary;
  final double expandedHeight;
  final BuildContext context;
  CustomSliverAppBar({required this.itinerary, required  this.expandedHeight, required this.context});

  @override
  Widget build(BuildContext context,double shrinkOffset, bool overlapsContent) {

    return Stack(
      fit: StackFit.expand,
      clipBehavior:  Clip.none,
      children: [
        //------------------------------------
        // Now we are loading title image
        //-------------------------------------
        Container(
          decoration: const BoxDecoration(color: Colors.grey),
          child: Opacity(
            opacity: 1 - shrinkOffset / expandedHeight,
            child: FadeInImage.assetNetwork(
              placeholder: 'assets/Logo_fini_ru.png',
              image: itinerary.featuredImage!.url,
              fit: BoxFit.cover,
             ),
          ),
        ),
        //------------------------------------
        // Here our arrow back and title of page
        //-------------------------------------
        Column(
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top),
            SizedBox(width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //----------------------
                //----    arrow back
                //----------------------
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child: const SizedBox(
                      height: kToolbarHeight,
                      width: 70,
                      child: Center(
                          child: Icon(Icons.arrow_back,
                              color: Colors.white
                          )
                      )
                  ),
                ),
                //----------------------
                //----    Title
                //----------------------
                Flexible(
                  child: Opacity(
                    opacity: shrinkOffset / expandedHeight,
                    child: Text(itinerary.title,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        )
                    ),
                  ),
                ),
                //----------------------
                //----    share button
                //----------------------
                GestureDetector(
                  onTap: (){
                    Share.share('Присоединяйтесь к поездке: ${itinerary.link}');
                  },
                  child: const SizedBox(
                      height: kToolbarHeight,
                      width: 70,
                      child: Center(
                          child: Icon(Icons.share,
                              color: Colors.white
                          )
                      )
                  ),
                ),
              ],
            ),)
          ],
        ),

        //------------------------------------
        // Here card with information of price (without sale)
        //-------------------------------------
        Positioned(

          top: expandedHeight - 70 - shrinkOffset,
          right: MediaQuery.of(context).size.width / 35,
          child: Opacity(
            opacity: (1 - shrinkOffset / expandedHeight),
            child: Card(
              shadowColor: Colors.grey,
              shape:const StadiumBorder(
                side: BorderSide(
                color: Colors.black,
                width: 1.0,
                ),
              ),
              color: const Color.fromRGBO(255, 255, 255, 0.6),
              elevation: 10,
              child: SizedBox(
                height: 50,
                width: 150,
                child: Center(
                  child: Text(itinerary.wpTravelPrice!,
                    style: const TextStyle(color: Colors.black,
                    fontSize: 34)
                    ),
                ),
              ),
            ),
          ),
        ),
        //------------------------------------
        // Here card with information of travel date
        //-------------------------------------
        Positioned(
          top: expandedHeight - 70 - shrinkOffset,
          left: MediaQuery.of(context).size.width / 35,
          child: Opacity(
            opacity: (1 - shrinkOffset / expandedHeight),
            child: Card(
              shadowColor: Colors.grey,
              shape:const StadiumBorder(
                side: BorderSide(
                  color: Colors.black,
                  width: 1.0,
                ),
              ),
              color: const Color.fromRGBO(255, 255, 255, 0.6),
              elevation: 10,
              child: SizedBox(
                height: 50,
                width: 150,
                child: DateText(
                    startDate: itinerary.wpTravelStartDate!,
                    endDate: itinerary.wpTravelEndDate!
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent =>MediaQuery.of(context).padding.top + kToolbarHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;

}
