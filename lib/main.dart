import 'package:flutter/material.dart';
import 'package:youflix/controllers/RegisterController.dart';
import 'package:youflix/screens/auth/auth.dart';
import 'package:youflix/service/root_service.dart';
import 'package:get/get.dart';
import 'package:youflix/controllers/AuthController.dart';

import 'package:youflix/screens/auth/auth.dart';
import 'package:youflix/screens/auth/register/register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initControllers();
  }

  RootService initServices() {
    RootService rootService = RootService();

    return rootService;
  }

  void initControllers() {
    final services = initServices();

    Get.put(
      AuthController(
        rootService: services,
      ),
    );
    Get.put(
      RegisterController(
        rootService: services,
      ),
    );
  }

  List<GetPage> renderPage() {
    return [
      GetPage(
          name: '/auth',
          page: () => AuthScreen(),
      ),
      GetPage(
        name: '/auth/register',
        page: () => RegisterScreen(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/auth',
      //debugShowCheckedModeBanner: false,
      getPages: renderPage(),
    );
  }
}


