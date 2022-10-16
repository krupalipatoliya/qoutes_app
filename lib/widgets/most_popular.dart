import 'package:flutter/material.dart';
import 'package:flutter_app/helper/api.dart';
import 'package:flutter_app/helper/database.dart';

class MostPopular extends StatefulWidget {
  @override
  _MostPopularState createState() => _MostPopularState();
}

class _MostPopularState extends State<MostPopular> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Most Popular",
            style: Theme.of(context).textTheme.caption,
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  dbh.getDataFVDB();
                  dbh.getData();
                  Navigator.of(context)
                      .pushNamed("/quotes_screen", arguments: "Advice Quotes");
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage("assets/images/5.jpg")),
                  ),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 4,
                    width: MediaQuery.of(context).size.width / 2.3,
                    child: Center(
                        child: Text(
                      "Advice\nQuotes",
                      style: Theme.of(context).textTheme.headline1,
                      textAlign: TextAlign.center,
                    )),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  dbh.getDataFVDB();
                  dbh.getData();
                  Navigator.of(context)
                      .pushNamed("/quotes_screen", arguments: "Change Quotes");
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage("assets/images/5.jpg")),
                  ),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 4,
                    width: MediaQuery.of(context).size.width / 2.3,
                    child: Center(
                        child: Text(
                      "Change\nQuotes",
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
                onTap: () {
                  dbh.getDataFVDB();
                  dbh.getData();
                  Navigator.of(context).pushNamed("/quotes_screen",
                      arguments: "Jean-Paul Sartre Quotes");
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage("assets/images/4.jpg")),
                  ),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 4,
                    width: MediaQuery.of(context).size.width / 2.3,
                    child: Center(
                        child: Text(
                      "Jean-Paul Sartre\nQuotes",
                      style: Theme.of(context).textTheme.headline1,
                      textAlign: TextAlign.center,
                    )),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  dbh.getDataFVDB();
                  dbh.getData();
                  Navigator.of(context).pushNamed("/quotes_screen",
                      arguments: "Arthur Schopenhauer Quotes");
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage("assets/images/5.jpg")),
                  ),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 4,
                    width: MediaQuery.of(context).size.width / 2.3,
                    child: Center(
                      child: Text(
                        "Arthur Schopenhauer\nQuotes",
                        style: Theme.of(context).textTheme.headline1,
                        textAlign: TextAlign.center,
                      ),
                    ),
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
