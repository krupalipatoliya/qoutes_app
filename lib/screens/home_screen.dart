import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/helper/api.dart';
import 'package:flutter_app/helper/database.dart';
import 'package:flutter_app/widgets/most_popular.dart';
import 'package:flutter_app/widgets/quotes_author.dart';
import 'package:flutter_app/widgets/quotes_category.dart';
import 'package:flutter_app/widgets/top_author.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List img = [
    "assets/images/1.jpg",
    "assets/images/2.jpg",
    "assets/images/3.jpg",
    "assets/images/4.jpg",
    "assets/images/5.jpg",
  ];

  @override
  void initState() {
    // api.getData();
    super.initState();
    myApi.getdataApi();
    dbh.getDataFVDB();
    dbh.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Quotes App",
          style: TextStyle(color: CupertinoColors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 20),
              Material(
                borderRadius: BorderRadius.circular(20),
                elevation: 10,
                child: Container(
                  height: MediaQuery.of(context).size.height / 3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Carousel(
                      radius: Radius.circular(50),
                      images: [
                        Image.asset(
                          img[0],
                          fit: BoxFit.fill,
                        ),
                        Image.asset(
                          img[1],
                          fit: BoxFit.fill,
                        ),
                        Image.asset(
                          img[2],
                          fit: BoxFit.fill,
                        ),
                        Image.asset(
                          img[3],
                          fit: BoxFit.fill,
                        ),
                        Image.asset(
                          img[4],
                          fit: BoxFit.fill,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    radius: 30,
                    child: IconButton(
                      color: Colors.deepOrange,
                      icon: Icon(Icons.picture_in_picture),
                      onPressed: () {},
                    ),
                    backgroundColor: Colors.black26,
                  ),
                  CircleAvatar(
                    radius: 30,
                    child: IconButton(
                      icon: Icon(Icons.book),
                      color: Colors.red,
                      onPressed: () {},
                    ),
                    backgroundColor: Colors.green,
                  ),
                  CircleAvatar(
                    radius: 30,
                    child: IconButton(
                      color: Colors.pink,
                      icon: Icon(Icons.animation),
                      onPressed: () {},
                    ),
                    backgroundColor: Colors.blue,
                  ),
                  CircleAvatar(
                    radius: 30,
                    child: IconButton(
                      color: Colors.amber,
                      iconSize: 30,
                      icon: Icon(Icons.star),
                      onPressed: () {
                        Navigator.of(context).pushNamed("/favorite_screen",
                            arguments: "Favorite Quotes");
                      },
                    ),
                    backgroundColor: Colors.lightGreenAccent,
                  ),
                ],
              ),
              SizedBox(height: 15),
              MostPopular(),
              SizedBox(height: 20),
              QuotesByCategory(),
              SizedBox(height: 20),
              QuotesByAuthor(),
              SizedBox(height: 20),
              TopAuthor(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
