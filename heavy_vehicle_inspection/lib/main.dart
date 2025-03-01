
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heavy_vehicle_inspection/components/selctiopage.dart';
import 'package:heavy_vehicle_inspection/login%20screen%20repo/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? isviewed;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isviewed = prefs.getInt('onBoard');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: isviewed != 0 ? const LogInScreen() : const SelectionPage(),
    );
  }
}



