import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/auth/auth_email_controller.dart';
import '../authscreen/login_email_screen.dart';
import '../feedback/feeldback_screen.dart';
import '../home/home.dart';
import '../jobpost/create/create_jobpost_screen.dart';
import '../school/create/basic_info_screen.dart';
import '../settings/settings_screen.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthEmailController authController = Get.find<AuthEmailController>();
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.red.shade100,
                    Colors.red.shade800,
                    Colors.red.shade600,
                  ]),
            ),
            child: authController.getUserDetails()?.photoURL != null
                ? Center(
                    child: CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                      authController.getUserDetails()?.photoURL ??
                          'https://via.placeholder.com/150',
                    ),
                  ))
                : Container(),
          ),
          const SizedBox(height: 10),
          _buildDrawerItem(
              icon: Icons.home,
              text: 'Home',
              onTap: () => Get.to(() => const Home())),
          _buildDrawerItem(
              icon: Icons.search,
              text: 'Rechercher un Prof',
              onTap: () => Get.to(() => const BasicInfoScreen())),
          _buildDrawerItem(
              icon: Icons.people,
              text: 'Créer une annonce',
              onTap: () => Get.to(() => const CreateJobPostScreen())),
          _buildDrawerItem(
              icon: Icons.feedback_outlined,
              text: 'Feedback',
              onTap: () => Get.to(() => const FeedbackScreen())),
          _buildDrawerItem(
              icon: Icons.settings,
              text: 'Paramètres',
              onTap: () => Get.to(() => const SettingsScreen())),
          _buildDrawerItem(
              icon: Icons.share,
              text: "Partager L'application",
              onTap: () => Get.to(() => const SettingsScreen())),
          _buildDrawerItem(
              icon: Icons.comment,
              text: 'Noter',
              onTap: () => Get.to(() => const SettingsScreen())),
          _buildDrawerItem(
              icon: Icons.perm_device_information,
              text: 'Nous contacter',
              onTap: () => _showContactInfo(context)),
          _buildDrawerItem(
              icon: Icons.output,
              text: 'Logout',
              onTap: () => _confirmLogout(context, authController)),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
      {required IconData icon,
      required String text,
      required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, size: 30, color: Colors.red.shade800),
      title: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      onTap: onTap,
      trailing: const Icon(Icons.arrow_right),
    );
  }

  void _showContactInfo(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text(
          'Lelo Eduk Profs',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        message: const Text(
          'Veuillez contacter nos services pour toute information.\nEmail: leloeduk@gmail.com\nTéléphone: +243 82 60 67 867',
          style: TextStyle(fontSize: 16),
        ),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () => Get.back(),
            child: const Text('Fermer'),
          ),
        ],
      ),
    );
  }

  void _confirmLogout(
      BuildContext context, AuthEmailController authController) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Confirmation de Déconnexion'),
        content: const Text('Êtes-vous sûr de vouloir vous déconnecter?'),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () => Get.back(),
            child: const Text('Annuler'),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () async {
              await authController.logout();
              Get.offAll(() => LoginScreen());
            },
            child: const Text('Se Déconnecter'),
          ),
        ],
      ),
    );
  }
}
