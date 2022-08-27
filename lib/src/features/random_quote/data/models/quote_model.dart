class QuoteModel {
  String author;
  int id;
  String quote;
  String permalink;
  QuoteModel({
    required this.author,
    required this.id,
    required this.quote,
    required this.permalink,
  });

  factory QuoteModel.fromJson(Map<String, dynamic> json) => QuoteModel(
        author: json["author"],
        id: json["id"],
        quote: json["quote"],
        permalink: json["permalink"],
      );

  Map<String, dynamic> toJson() => {
        "author": author,
        "id": id,
        "quote": quote,
        "permalink": permalink,
      };
}
