import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_git_blog/firebase_options.dart';
import 'package:flutter_git_blog/router/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp.router(
    debugShowCheckedModeBanner: false,
    routerConfig: router,
  ));
}
