import 'package:emcus/di/di.dart';
import 'package:emcus/firebase_options.dart'; 
import 'package:emcus/modules/splash/view/pages/splash_screen.dart';
import 'package:emcus/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); 
   await init();
  runApp(const EmcusApp());
}

class EmcusApp extends StatelessWidget {
  const EmcusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: Routes.generateRoute,
      theme: ThemeData(
        fontFamily: 'Humanst521',
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
