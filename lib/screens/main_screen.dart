import 'package:flutter/material.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';
import 'package:happy_soul/constants.dart';
import 'package:happy_soul/screens/activities/breating_activity.dart';
import 'package:happy_soul/screens/harmony/home/screens/home.dart';
import 'package:happy_soul/screens/shortsScreens/home_page.dart';

class MainScreen extends StatelessWidget {
  static const String id = 'main_screen';
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            kPrimaryColor,
            kSecondaryColor
          ],
        ),
        title: const Text('Happy Soul'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              kPrimaryColor,
              kSecondaryColor// Adjust the color based on your design
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildCustomCard(
                  'Shorts',
                  'assets/shorts_bg.png', // Update with your image path
                      () {
                    Navigator.pushNamed(context, ShortsScreen.id);
                  },
                ),
                 // Add space between cards
                const SizedBox(height: 16.0),
                _buildCustomCard(
                  'Harmoney',
                  'assets/harmoney.png', // Update with your image path
                      () {
                    Navigator.pushNamed(context, HarmonyHomeScreen.id);
                  },
                ),
                const SizedBox(height: 16.0),
                _buildCustomCard(
                  'Breathing Activity',
                  'assets/breathing_activity.png', // Update with your image path
                      () {
                    Navigator.pushNamed(context, BreathingActivity.id);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCustomCard(String title, String imagePath, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Card(

        color: kButtonColor.withOpacity(0.8), // Adjust card color based on your design
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                height: 150, // Adjust height based on your design
                width: double.infinity,
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: kPrimaryColor,
              ),
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white, // Adjust text color based on your design
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
