import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCiRoL1D7Q8pVHVL_6A_FjErjCbtlXE2ic",
          appId: "1:919728441332:web:243a921862d339ee9d1ba1",
          messagingSenderId: "919728441332",
          projectId: "xpert-lab-app",
          storageBucket: "xpert-lab-app.appspot.com"));
  runApp(
    ScreenUtilInit(
        designSize: const Size(700, 1200),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Xpert Lab Admin",
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
          );
        }),
  );
}
