// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../controllers/auth/auth_phone_controller.dart';

// class CodeVerificationScreen extends StatefulWidget {
//   const CodeVerificationScreen({super.key, required this.verificationId});

//   final String verificationId;

//   @override
//   State<CodeVerificationScreen> createState() => _CodeVerificationScreenState();
// }

// class _CodeVerificationScreenState extends State<CodeVerificationScreen> {
//   final AuthPhoneController _authPhoneController =
//       Get.find<AuthPhoneController>();
//   final TextEditingController _codeController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _authPhoneController.verificationId.value = widget.verificationId;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Vérification du Code')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: _codeController,
//               decoration: const InputDecoration(
//                 labelText: 'Code de vérification',
//                 border: OutlineInputBorder(),
//               ),
//               keyboardType: TextInputType.number,
//             ),
//             const SizedBox(height: 20),
//             Obx(() {
//               if (_authPhoneController.isVerifying.value) {
//                 return const CircularProgressIndicator();
//               }
//               return ElevatedButton(
//                 onPressed: () {
//                   _authPhoneController.verifyCode(_codeController.text);
//                 },
//                 child: const Text('Vérifier'),
//               );
//             }),
//             const SizedBox(height: 20),
//             Obx(() {
//               if (_authPhoneController.verificationStatus.value.isNotEmpty) {
//                 return Text(
//                   _authPhoneController.verificationStatus.value,
//                   style: const TextStyle(color: Colors.red),
//                 );
//               }
//               return Container();
//             }),
//             const SizedBox(height: 20),
//             Obx(() {
//               return ElevatedButton(
//                 onPressed: _authPhoneController.resendButtonEnabled.value
//                     ? () {
//                         // Renvoyer le code
//                         _authPhoneController.resendCode(
//                             '+1234567890'); // Remplacez par le numéro de téléphone réel
//                       }
//                     : null,
//                 child: Text(
//                   _authPhoneController.resendButtonEnabled.value
//                       ? 'Renvoyer le Code'
//                       : 'Attendez ${_authPhoneController.countdownSeconds.value} secondes',
//                 ),
//               );
//             }),
//           ],
//         ),
//       ),
//     );
//   }
// }
