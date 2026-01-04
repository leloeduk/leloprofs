import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/auth/auth_email_controller.dart';
import 'screens/authscreen/login_email_screen.dart';
import 'screens/splash/splash_screen.dart';
import 'package:firebase_app_check/firebase_app_check.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Initialisation de Firebase
    await Firebase.initializeApp();
    await FirebaseAppCheck.instance.activate(
      webProvider: ReCaptchaV3Provider(
          '6Lce6yYqAAAAAPtBwZg6jLUIAfeHa63D1JMvh7qm'), // Remplacez par votre clé ReCaptcha
      androidProvider: AndroidProvider.debug,
      appleProvider: AppleProvider.appAttest,
    );

    // Test de la récupération des enseignants
    // await testFetch();

    runApp(const MyApp());
  } catch (e) {
    print('Erreur d\'initialisation : $e');
    // Gérer les erreurs d'initialisation, par exemple afficher un message ou effectuer une action de secours
  }
}

// Méthode de test pour récupérer les enseignants
// Future<void> testFetch() async {
//   try {
//     final snapshot =
//         await FirebaseFirestore.instance.collection('teachers').get();
//     print('Documents fetched: ${snapshot.docs.length}');
//     for (var doc in snapshot.docs) {
//       print('Document data: ${doc.data()}');
//     }
//   } catch (e) {
//     print('Error fetching documents: $e');
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Obx(() {
        final authController = Get.put(AuthEmailController());
        return authController.firebaseUser.value != null
            ? const SplashScreen() // Ou la page principale de votre application
            : LoginScreen();
      }),
    );
  }
}
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_app_check/firebase_app_check.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'controllers/auth/auth_controller.dart';
// import 'screens/splash/splash_screen.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   try {
//     // Initialisation de Firebase
//     await Firebase.initializeApp();

//     // Activation de Firebase App Check avec les différents fournisseurs
//     await FirebaseAppCheck.instance.activate(
//       webProvider: ReCaptchaV3Provider(
//           '6Lce6yYqAAAAAPtBwZg6jLUIAfeHa63D1JMvh7qm'), // Remplacez par votre clé ReCaptcha
//       androidProvider: AndroidProvider.debug,
//       appleProvider: AppleProvider.appAttest,
//     );

//     // Initialisation de SharedPreferences
//     final SharedPreferences preferences = await SharedPreferences.getInstance();

//     // Initialisation des dépendances GetX
//     Get.put(AuthController(
//         googleSignIn: GoogleSignIn(),
//         firebaseAuth: FirebaseAuth.instance,
//         preferences: preferences));

//     // Test de la récupération des enseignants
//     await testFetch();

//     runApp(const MyApp());
//   } catch (e) {
//     print('Erreur d\'initialisation : $e');
//     // Gérer les erreurs d'initialisation, par exemple afficher un message ou effectuer une action de secours
//   }
// }èèè
// // Méthode de test pour récupérer les enseignants
// Future<void> testFetch() async {
//   try {
//     final snapshot =
//         await FirebaseFirestore.instance.collection('teachers').get();
//     print('Documents fetched: ${snapshot.docs.length}');
//     for (var doc in snapshot.docs) {
//       print('Document data: ${doc.data()}');
//     }
//   } catch (e) {
//     print('Error fetching documents: $e');
//   }
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       theme: ThemeData(
//         primarySwatch: Colors.red,
//         scaffoldBackgroundColor: Colors.white,
//         inputDecorationTheme: InputDecorationTheme(
//           border: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.red.shade900),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.red.shade900),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.red.shade900),
//           ),
//           labelStyle: TextStyle(color: Colors.red.shade900),
//           hintStyle: TextStyle(color: Colors.grey.shade800),
//         ),
//         textTheme: TextTheme(
//           titleLarge: TextStyle(color: Colors.red.shade900),
//           bodyMedium: TextStyle(color: Colors.red.shade900),
//         ),
//       ),
//       home: const SplashScreen(),
//     );
//   }
// }

