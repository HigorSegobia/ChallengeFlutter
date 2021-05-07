import 'package:challenge_flutter/provider/items.dart';
import 'package:challenge_flutter/routes/app_routes.dart';
import 'package:challenge_flutter/screens/home/components/item_form.dart';
import 'package:challenge_flutter/screens/login/login_screen.dart';
import 'package:challenge_flutter/screens/splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Items(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routes: {
            AppRoutes.SPLASHSCREEN: (_) => SplashScreenPage(),
            AppRoutes.LOGIN: (_) => LoginScreen(),
            AppRoutes.ITEM_FORM: (_) => ItemForm(),
          }),
    );
  }
}
