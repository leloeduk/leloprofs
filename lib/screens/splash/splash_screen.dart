import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:leloprofs/screens/onboarding/onboarding_screen.dart';
import '../../controllers/auth/auth_email_controller.dart';
import '../authscreen/login_email_screen.dart';
import '../home/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool onboardingCompleted =
        prefs.getBool('onboardingCompleted') ?? false;
    final authController = Get.find<AuthEmailController>();

    // Attendre un temps court, juste pour l'affichage du logo
    await Future.delayed(const Duration(seconds: 2));

    if (!onboardingCompleted) {
      // Redirige vers l'écran d'onboarding
      await Get.offAll(() => const OnboardingScreen());
    } else if (await authController.isLoggedIn()) {
      // Redirige vers l'écran d'accueil
      await Get.offAll(() => const Home());
    } else {
      // Redirige vers l'écran de connexion
      await Get.offAll(() => LoginScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/images/leloprof.png',
              width: 150,
              height: 150,
            ),
          ),
          const SizedBox(height: 20),
          const CircularProgressIndicator(
            color: Colors.red,
          )
        ],
      ),
    );
  }
}
