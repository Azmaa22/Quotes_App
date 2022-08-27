import 'dart:async';

import 'package:clean_architecture_app/src/config/routes/app_routes.dart';
import 'package:clean_architecture_app/src/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  void _goToQuoteScreen() {
    Navigator.pushReplacementNamed(
      context,
      AppRoutes.quoteScreen,
    );
  }

  _startDelay() {
    _timer =
        Timer(const Duration(milliseconds: 2000), () => _goToQuoteScreen());
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          AppAssets.logo,
        ),
      ),
    );
  }
}
