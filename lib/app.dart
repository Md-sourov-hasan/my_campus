import 'package:flutter/material.dart';
import 'package:task/core/utils/constants/app_theme.dart';
import 'package:task/routes/app_routes.dart';

/// Root application widget for MyCampus.
/// Uses MaterialApp.router with GoRouter configuration.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'MyCampus',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routerConfig: AppRoute.router,
    );
  }
}
