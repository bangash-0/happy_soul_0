import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:happy_soul/screens/SplashScreen.dart';
import 'package:happy_soul/screens/activities/breating_activity.dart';
import 'package:happy_soul/screens/email_verification.dart';
import 'package:happy_soul/screens/main_screen.dart';
import 'package:happy_soul/screens/resetPasswordScreen.dart';
import 'package:happy_soul/screens/login_screen.dart';
import 'package:happy_soul/screens/registration_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'screens/harmony/home/screens/home.dart';
import 'screens/shortsScreens/home_page.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ProviderScope(child: FlashChat()));
}

class FlashChat extends StatelessWidget {
  const FlashChat({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData.light().copyWith(
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.black54),
        ),
      ),

      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      initialRoute: SplashScreen.id,

      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        EmailVerification.routeName: (context) => const EmailVerification(),
        LoginScreen.id: (context) => const LoginScreen(),
        RegistrationScreen.id: (context) => const RegistrationScreen(),
        MainScreen.id: (context) => const MainScreen(),
        ResetPaswordScreen.id: (context) => const ResetPaswordScreen(),
        BreathingActivity.id: (context) => const BreathingActivity(),
        HarmonyHomeScreen.id: (context) => const HarmonyHomeScreen(),
        ShortsScreen.id: (context) => ShortsScreen(),
      },
    );
  }
}