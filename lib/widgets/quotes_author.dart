import 'package:flutter/material.dart';

class QuotesByAuthor extends StatefulWidget {
  @override
  _QuotesByAuthorState createState() => _QuotesByAuthorState();
}

class _QuotesByAuthorState extends State<QuotesByAuthor> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Quotes by Author",
                style: Theme.of(context).textTheme.caption,
              ),
              Text("View All >",style: Theme.of(context).textTheme.caption.copyWith(color: Colors.redAccent,fontSize: 18),)
            ],
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: (){
                  Navigator.of(context).pushNamed('/quotes_screen',arguments: "C.S. Quotes");
                },
                child: Material(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.redAccent.shade200,
                  elevation: 10,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 7,
                    width: MediaQuery.of(context).size.width / 2.3,
                    child: Center(
                        child: Text(
                          "C.S.Lewis\nQuotes",
                          style: Theme.of(context).textTheme.headline1,
                          textAlign: TextAlign.center,
                        )),
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.of(context).pushNamed('/quotes_screen',arguments: "Ansel Adams Quotes");
                },
                child: Material(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.indigo,
                  elevation: 10,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 7,
                    width: MediaQuery.of(context).size.width / 2.3,
                    child: Center(
                        child: Text(
                          "Ansel Adams\nQuotes",
                          style: Theme.of(context).textTheme.headline1,
                          textAlign: TextAlign.center,
                        )),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: (){
                  Navigator.of(context).pushNamed('/quotes_screen',arguments: "Usain Bolt Quotes");
                },
                child: Material(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.amber,
                  elevation: 10,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 7,
                    width: MediaQuery.of(context).size.width / 2.3,
                    child: Center(
                        child: Text(
                          "Usain Bolt\nQuotes",
                          style: Theme.of(context).textTheme.headline1,
                          textAlign: TextAlign.center,
                        )),
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.of(context).pushNamed('/quotes_screen',arguments: "JK Rowling Quotes");
                },
                child: Material(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.red.shade200,
                  elevation: 10,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 7,
                    width: MediaQuery.of(context).size.width / 2.3,
                    child: Center(
                      child: Text(
                        "JK Rowling\nQuotes",
                        style: Theme.of(context).textTheme.headline1,
                        textAlign: TextAlign.center,
                      ),),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
