import 'dart:developer';

import 'package:bloc_itineraries/bloc_observable.dart';
import 'package:bloc_itineraries/ui/pages/home_page.dart';
import 'package:bloc_itineraries/ui/pages/itinerary_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_notification_channel/flutter_notification_channel.dart';
import 'package:flutter_notification_channel/notification_importance.dart';
import 'package:flutter_notification_channel/notification_visibility.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  log("Handling a background message: ${message.messageId}");
}

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  /// waiting for background messages
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  /// Registration our channel to get notification
  await FlutterNotificationChannel.registerNotificationChannel(
    description: 'Your channel description',
    id: 'NewItinerary',
    importance: NotificationImportance.IMPORTANCE_HIGH,
    name: 'New Itinerary',
    visibility: NotificationVisibility.VISIBILITY_PUBLIC,
    allowBubbles: true,
    enableVibration: true,
    enableSound: true,
    showBadge: true,
  );
  /// subscribing to the topic
  await FirebaseMessaging.instance.subscribeToTopic('NewItinerary');

  /// getting state from storage
  final storage = await HydratedStorage.build(
      storageDirectory: await getTemporaryDirectory()
  );
  HydratedBlocOverrides.runZoned(
          () => runApp(const MyApp()),
    blocObserver: ItineraryBlocObservable(),
    storage: storage,
  );
  
  /*BlocOverrides.runZoned(
          () => runApp(const MyApp()),
    blocObserver: ItineraryBlocObservable(),
  );*/

}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "По Белу Свету",
        theme: ThemeData(
          brightness:  Brightness.light,
          primaryColor: Colors.black,
          fontFamily: 'Georgia',
          textTheme: const TextTheme(
            headline1: TextStyle(
              fontSize: 50, fontWeight:  FontWeight.bold, color: Colors.white),
            headline2: TextStyle(
                fontSize: 30, fontWeight:  FontWeight.w700, color: Colors.white),
            headline3: TextStyle(
                fontSize: 24, color: Colors.white),
            bodyText2: TextStyle(
                fontSize: 16, fontWeight:  FontWeight.w500, color: Colors.white),
            bodyText1: TextStyle(
                fontSize: 12, fontWeight:  FontWeight.w200, color: Colors.white),
            caption: TextStyle(
                fontSize: 11, fontWeight:  FontWeight.w100, color: Colors.grey),
            ),
        ),
      initialRoute: '/',
      routes: {
          '/': (context) => HomePage(title: 'По Белу Свету'),
      //  '/rules' :
      },
    );
  }
}
