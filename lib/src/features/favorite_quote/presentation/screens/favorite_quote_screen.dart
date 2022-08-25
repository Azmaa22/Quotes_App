import 'package:clean_architecture_app/src/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class FavoriteQuoteScreen extends StatelessWidget {
  const FavoriteQuoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppStrings.appName,
        ),
      ),
    );
  }
}
