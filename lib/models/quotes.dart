class Quotes{
  int id;
  String author;
  String quotes;

  Quotes({this.author,this.quotes});

  Quotes.create({this.id,this.author,this.quotes});

  factory Quotes.fromJson(Map json){
    return Quotes(
      author: json['a'],
      quotes: json['q'],
    );
  }
}