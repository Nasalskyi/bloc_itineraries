import 'package:bloc_itineraries/ui/pages/booking_page.dart';
import 'package:bloc_itineraries/ui/widgets/custom_sliver_app_bar.dart';
import 'package:bloc_itineraries/ui/widgets/custom_tab_bar.dart';
import 'package:bloc_itineraries/ui/widgets/custom_tab_bar_view.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:bloc_itineraries/data/models/itinerary.dart';

class ItineraryPage extends StatelessWidget {
  final Itinerary itinerary;
  const ItineraryPage({Key? key, required this.itinerary}) : super(key: key);

  void _launchURL(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }
  @override
  Widget build(BuildContext context) {
    var _urlViber = "https://invite.viber.com/?g2=AQBCOqod%2FPvZQ0lBKwPPtoXCuSJwTx%2B0ndA1uB8ymAimqxYzI2pY1ggZgaiAZue1&fbclid=IwAR317rq5OnGJVdJs0n7gFUnX_KnoyYNovxn5Zc7k29OWfRNYmrm2wfXwpOY&lang=ru";
    var _urlFB = "https://www.facebook.com/tourclubPoBeluSvetu";
    var _urlTelegram = "https://t.me/po_belu_svetu";
    var _urlPhone = "tel:+380956316911";
    var _urlMail = "mailto:smith@example.org?subject=News&body=New%20plugin";
    return Scaffold(
      body: Column(
        children: [
          LimitedBox(
            maxHeight: MediaQuery.of(context).size.height-55,
            child: DefaultTabController(
              length: 4,
              child: NestedScrollView(
                headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled)
                {
                  return <Widget>[
                    SliverPersistentHeader(
                      delegate: CustomSliverAppBar(
                          itinerary: itinerary,
                          expandedHeight: 400,
                          context: context
                        ),
                      pinned: true,
                    ),
                     const SliverPadding(
                      padding: EdgeInsets.all(2.0),
                      sliver: SliverPersistentHeader(
                        delegate: CustomTabBar(),
                        pinned: true,
                        ),
                      ),
                  ];
                },
                body: CustomTabBarView(itinerary: itinerary)
              ),
            ),
          ),
          SizedBox(
            height: 55,
            width: MediaQuery.of(context).size.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  [
                GestureDetector(
                  onTap: (){
                    _launchURL(_urlPhone);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(4),
                    child: Image(
                      image: AssetImage("assets/call_icon.png"),
                        width: 50, height: 50
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    _launchURL(_urlTelegram);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(4),
                    child: Image(
                      image:AssetImage("assets/telegram_icon.png"),
                        width: 50, height: 50
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    _launchURL(_urlViber);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(4),
                    child: Image(
                      image:AssetImage("assets/viber_icon.png"),
                        width: 50, height: 50
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    _launchURL(_urlFB);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(4),
                    child: Image(
                      image: AssetImage("assets/fb_icon.png",),
                        width: 50, height: 50
                    ),
                  ),
                ),
                 Expanded(
                   child: Padding(
                     padding: const EdgeInsets.all(4),
                       child: SizedBox.expand(
                         child: GestureDetector(
                           onTap: (){
                             Navigator.push(context, MaterialPageRoute(
                                 builder: (context) => BookingPage(itinerary: itinerary)
                             ));
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
          ),
        ],
      ),
    );
  }
}
