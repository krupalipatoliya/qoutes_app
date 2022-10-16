import 'package:flutter/material.dart';

class TopAuthor extends StatefulWidget {
  @override
  _TopAuthorState createState() => _TopAuthorState();
}

class _TopAuthorState extends State<TopAuthor> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Top Author",
            style: Theme.of(context).textTheme.caption,
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: (){
                  Navigator.of(context).pushNamed('/quotes_screen',arguments: "Abraham Lincoln");
                },
                child: Material(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue,
                  elevation: 10,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width / 2.3,
                    child: Center(
                        child: Text(
                          "Quotes of\nAbraham Lincoln",
                          style: Theme.of(context).textTheme.headline1,
                          textAlign: TextAlign.center,
                        )),
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.of(context).pushNamed('/quotes_screen',arguments: "Dalal Lama");
                },
                child: Material(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blueAccent,
                  elevation: 10,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width / 2.3,
                    child: Center(
                        child: Text(
                          "Quotes of\nDalai Lama",
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
                  Navigator.of(context).pushNamed('/quotes_screen',arguments: "Maya Angelou");
                },
                child: Material(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.lightBlue.shade400,
                  elevation: 10,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width / 2.3,
                    child: Center(
                        child: Text(
                          "Quotes of\nMaya Angelou",
                          style: Theme.of(context).textTheme.headline1,
                          textAlign: TextAlign.center,
                        )),
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.of(context).pushNamed('/quotes_screen',arguments: "Ralph Waldo Emerson");
                },
                child: Material(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue.shade100,
                  elevation: 10,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width / 2.3,
                    child: Center(
                      child: Text(
                        "Quotes of\nRalph Waldo Emerson",
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
