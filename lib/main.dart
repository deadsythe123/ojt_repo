import 'package:audit_finance_app/providers/states.dart';
import 'package:audit_finance_app/screens/cplus_landingpage.dart';
import 'package:audit_finance_app/screens/cplus_login.dart';
import 'package:audit_finance_app/screens/cplus_register.dart';
import 'package:audit_finance_app/screens/homepage.dart';
import 'package:audit_finance_app/screens/login.dart';
import 'package:audit_finance_app/screens/old/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<States>(create: (_) => States()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        ),
        primarySwatch: Colors.blueGrey,
      ),
      home: const Register(),
    );
  }
}
