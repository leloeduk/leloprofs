import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthEmailController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<User?> firebaseUser = Rx<User?>(null);

  @override
  void onInit() {
    super.onInit();
    firebaseUser.bindStream(_auth.authStateChanges());
  }

  // Vérifie si l'utilisateur est connecté
  Future<bool> isLoggedIn() async {
    return _auth.currentUser != null;
  }

  // Obtenir les détails de l'utilisateur connecté
  User? getUserDetails() {
    return _auth.currentUser;
  }

  // Inscription avec email et mot de passe
  Future<void> register(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Get.snackbar("Succès", "Compte créé avec succès !");
    } catch (e) {
      Get.snackbar("Erreur", e.toString());
    }
  }

  // Connexion avec email et mot de passe
  Future<void> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.snackbar("Succès", "Connexion réussie !");
    } catch (e) {
      Get.snackbar("Erreur", e.toString());
    }
  }

  // Déconnexion
  Future<void> logout() async {
    await _auth.signOut();
  }
}
