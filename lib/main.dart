import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_git_blog/common/color/light_app_color.dart';
import 'package:flutter_git_blog/firebase_options.dart';
import 'package:flutter_git_blog/prefs.dart';
import 'package:flutter_git_blog/router/router.dart';

void main() async {
  // firebase 초기화
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // shared_prefference 초기화
  await Prefs.init();
  runApp(MaterialApp.router(
    debugShowCheckedModeBanner: false,
    routerConfig: router,
    theme: ThemeData(
      fontFamily: 'Inter',
      colorScheme: ColorScheme.fromSeed(
        seedColor: LightAppColor.secondaryColor,
        primary: LightAppColor.primaryColor,
      ),
    ),
  ));
}
