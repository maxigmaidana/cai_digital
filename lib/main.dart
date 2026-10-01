import 'package:cai_digital/config/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Club Landing Page',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(
          0xFF121212,
        ), // Deep black background
        useMaterial3: true,
        textTheme: ThemeData.dark().textTheme.apply(
          fontFamily: 'Montserrat', // A clean, modern sans-serif
        ),
      ),
      routerConfig: AppRouter.router,
    );
  }
}
