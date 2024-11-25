

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'core/presentation/onboarding_screen.dart';
import 'core/presentation/splash/splash_screen.dart';
import 'core/utils/navigationservice.dart';



// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   ConsoleLogUtils.printLog(message.data.toString());
//   ConsoleLogUtils.printLog(message.notification!.title!);
//
// }


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  // Catch any errors caught by zones.

  //uncomment
/*  runZonedGuarded<Future<void>>(() async {
    // Logger.level = Level.verbose;
    print('starting app');
    if (Firebase.apps.isEmpty) {
      try {
        FirebaseAppManager.initializeFirebase();
        // await Firebase.initializeApp(
        //     options: DefaultFirebaseOptions.currentPlatform);
      } catch (e) {}
    }
    print('firebase inited');
    // runApp(MyApp());
  }, (error, stack) {

  });*/




  runApp(MyApp());

  // Eraser.clearAllAppNotifications();


}


class MyApp extends StatefulWidget {

  @override
  MyApp_screenState createState() =>
      MyApp_screenState();
}

class MyApp_screenState extends State<MyApp> with WidgetsBindingObserver
{
  late BuildContext buildContext;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

   // setFirebaseDelegateInstance(false);

    // WidgetsBinding.instance.addObserver(this);


  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }




  @override
  Widget build(BuildContext context)
  {
    buildContext = context;
    return GlobalLoaderOverlay(
      overlayColor: Colors.grey.withOpacity(0.5),
      overlayWidget: Center(child: CircularProgressIndicator()),
      child: MaterialApp(
        builder: (context, child) {
          return MediaQuery(
            child: child!,
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          );
        },
        theme: ThemeData(
            scaffoldBackgroundColor:Color.fromRGBO(250, 251, 252, 1),
          appBarTheme: AppBarTheme(elevation: 0.0), //This is important
        ),
        home:SplashScreen(),
        title: 'Q',
        debugShowCheckedModeBanner: false,
        //    initialRoute: '/SignUpScreen',//AppRoutes.iphone14PlusFifteenTabContainerScreen,
       // routes: AppRoutes.routes,
        navigatorKey: NavigationService.navigatorKey, // set property
        //'/signup_screen',
      ),

    );
    // , // Set the SplashScreen widget as the home page of your app.
  }



}
