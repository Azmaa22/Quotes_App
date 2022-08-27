import 'package:clean_architecture_app/src/core/utils/app_strings.dart';
import 'package:clean_architecture_app/src/features/random_quote/presentation/widgets/quote_card.dart';
import 'package:flutter/material.dart';

class QuoteScreen extends StatelessWidget {
  const QuoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppStrings.appName,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.refresh,
        ),
      ),
      body: const QuoteCard(
        quote: 'quote',
        author: 'author',
      ),
    );
  }
}
