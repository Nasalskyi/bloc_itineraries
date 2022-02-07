
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:bloc_itineraries/data/models/itinerary.dart';

class CustomListTile extends StatelessWidget {
  final Itinerary itinerary;

  const CustomListTile({Key? key, required this.itinerary}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: MediaQuery.of(context).size.height / 7,
        color: const Color.fromRGBO(86, 86, 86, 0.8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 4,
              child:CachedNetworkImage(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                imageUrl: itinerary.featuredImage!.url,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    )
                  ),
                ),
                placeholder: (context, url) => const Center(
                    child: SizedBox(
                      height:30,
                      width: 30,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.grey,
                      ),
                    )
                ),
                errorWidget: (context,url,error) => const Icon(Icons.error),
              )
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width/ 1.7,
                    //child: Flexible(
                      child: Text(
                        itinerary.title,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    //)
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Даты мероприятия:',
                              style: Theme.of(context).textTheme.caption,
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              itinerary.wpTravelStartDate!,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            if(itinerary.wpTravelStartDate!=itinerary.wpTravelEndDate!)
                              Text(
                              itinerary.wpTravelEndDate!,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Цена',

                            style: Theme.of(context).textTheme.caption
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(itinerary.wpTravelPrice!,
                              style: Theme.of(context).textTheme.headline3,
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}
