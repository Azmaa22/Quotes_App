import 'package:equatable/equatable.dart';

class Quote extends Equatable {
  final String author, quoteContent, permaLink;
  final int id;
  const Quote({
    required this.id,
    required this.quoteContent,
    required this.author,
    required this.permaLink,
  });
  @override
  List<Object?> get props => [
        id,
        author,
        quoteContent,
        permaLink,
      ];
}
