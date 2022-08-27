import 'package:clean_architecture_app/src/app.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(QuoteApp(
    sharedPreferences: sharedPreferences,
  ));
}
