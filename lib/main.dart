import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_git_blog/firebase_options.dart';
import 'package:flutter_git_blog/login_page.dart';

import 'login.dart';
//import 'package:flutter_git_blog_2024/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MaterialApp(
    home: LoginPage(),
  ));
}
