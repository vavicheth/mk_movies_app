import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mk_movies_app/screens/categories.dart';
import 'package:mk_movies_app/screens/login.dart';
import 'package:mk_movies_app/screens/register.dart';

void main() {
  runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'login',
        routes: {
          'login': (context) => const MyLogin(),
          'register': (context) => const MyRegister(),
          'categories': (context) => const MyCategory(),
        }),
  );
}
