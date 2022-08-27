import 'package:clean_architecture_app/src/core/utils/app_strings.dart';
import 'package:clean_architecture_app/src/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:clean_architecture_app/src/features/random_quote/presentation/cubit/random_quote_state.dart';
import 'package:clean_architecture_app/src/features/random_quote/presentation/widgets/quote_card.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuoteScreen extends StatelessWidget {
  const QuoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RandomQuoteCubit, RandomQuoteState>(
      builder: (context, state) {
        RandomQuoteCubit myCubit = RandomQuoteCubit.get(context);
        if (state is RandomQuoteIsLoading) {
          return const CircularProgressIndicator();
        } else if (state is RandomQuoteHaveError) {
          return Text(state.errorMsg);
        } else if (state is RandomQuoteIsLoaded) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                AppStrings.appName,
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                myCubit.getRandomQuote();
              },
              child: const Icon(
                Icons.refresh,
              ),
            ),
            body: QuoteCard(
              quote: state.quote,
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
