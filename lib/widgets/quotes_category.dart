import 'package:flutter/material.dart';

class QuotesByCategory extends StatefulWidget {
  @override
  _QuotesByCategoryState createState() => _QuotesByCategoryState();
}

class _QuotesByCategoryState extends State<QuotesByCategory> {
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
                "Quotes by Category",
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
                  Navigator.of(context).pushNamed('/quotes_screen',arguments: "Cute Quotes");
                },
                child: Material(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.pink.shade600,
                  elevation: 10,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 7,
                    width: MediaQuery.of(context).size.width / 2.3,
                    child: Center(
                        child: Text(
                          "Cute\nQuotes",
                          style: Theme.of(context).textTheme.headline1,
                          textAlign: TextAlign.center,
                        )),
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.of(context).pushNamed('/quotes_screen',arguments: "Travel Quotes");
                },
                child: Material(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue.shade900,
                  elevation: 10,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 7,
                    width: MediaQuery.of(context).size.width / 2.3,
                    child: Center(
                        child: Text(
                          "Travel\nQuotes",
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
                  Navigator.of(context).pushNamed('/quotes_screen',arguments: "Inspiration Quotes");
                },
                child: Material(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blueAccent,
                  elevation: 10,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 7,
                    width: MediaQuery.of(context).size.width / 2.3,
                    child: Center(
                        child: Text(
                          "Inspiration\nQuotes",
                          style: Theme.of(context).textTheme.headline1,
                          textAlign: TextAlign.center,
                        )),
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.of(context).pushNamed('/quotes_screen',arguments: "Emotions Quotes");
                },
                child: Material(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.brown,
                  elevation: 10,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 7,
                    width: MediaQuery.of(context).size.width / 2.3,
                    child: Center(
                      child: Text(
                        "Emotions\nQuotes",
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
