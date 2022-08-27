import 'package:clean_architecture_app/src/core/utils/app_colors/app_colors.dart';
import 'package:clean_architecture_app/src/core/utils/media_query_values.dart';
import 'package:clean_architecture_app/src/features/random_quote/domain/entities/quote.dart';
import 'package:flutter/material.dart';

class QuoteCard extends StatelessWidget {
  final Quote quote;
  const QuoteCard({
    Key? key,
    required this.quote,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: context.height * 0.2,
      margin: const EdgeInsets.all(
        10.0,
      ),
      padding: const EdgeInsets.all(
        10.0,
      ),
      decoration: BoxDecoration(
        color: AppColors.kWhiteColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            15.0,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.kSecondaryColor,
            blurRadius: 5,
            offset: const Offset(2, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            quote.quoteContent,
            style: Theme.of(context).textTheme.headline4,
          ),
          const Spacer(),
          Text(
            quote.author,
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: AppColors.kPrimaryColor,
                ),
          ),
        ],
      ),
    );
  }
}
