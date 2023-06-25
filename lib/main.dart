import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gogol/screens/addHealthCard.dart';
import 'package:gogol/screens/advertisement.dart';
import 'package:gogol/screens/changeAddress.dart';
import 'package:gogol/screens/Chat.dart';
import 'package:gogol/screens/changePassword.dart';
import 'package:gogol/screens/chatPage.dart';
import 'package:gogol/screens/checkSymptoms3.dart';
import 'package:gogol/screens/healthcardCurrentUser.dart';
import 'package:gogol/screens/myCartCurrentUser.dart';
import 'package:gogol/screens/newUserHealthCard.dart';
import 'package:gogol/screens/newUserReminder.dart';
import 'package:gogol/screens/orderReceived.dart';
import 'package:gogol/screens/productChat.dart';
import 'package:gogol/screens/profileDrawer.dart';
import 'package:gogol/screens/reminderCurrentUser.dart';
import 'package:gogol/screens/home.dart';
import 'package:gogol/screens/splash.dart';
import 'package:gogol/utils/loading.dart';

import 'NavBar.dart';
import 'controllers/auth_controller.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      name: "Olivers Pharmacy",
      options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gogol',
      home: SplashScreen(),
    );
  }
}
