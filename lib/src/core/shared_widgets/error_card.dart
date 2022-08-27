import 'package:clean_architecture_app/src/core/utils/app_colors/app_colors.dart';
import 'package:clean_architecture_app/src/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class ErrorCard extends StatelessWidget {
  final VoidCallback? onPress;
  const ErrorCard({
    Key? key,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (onPress != null) {
            onPress!();
          }
        },
        child: const Icon(
          Icons.refresh_rounded,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Icon(
              Icons.warning_amber_rounded,
              size: 200.0,
            ),
          ),
          Text(
            AppStrings.someThingError,
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: AppColors.kSecondaryColor,
            ),
          ),
          Text(
            AppStrings.tryAgain,
            style: TextStyle(
              fontSize: 20.0,
              color: AppColors.kSecondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
