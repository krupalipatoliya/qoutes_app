import 'package:flutter/material.dart';
import 'package:flutter_app/helper/api.dart';
import 'package:flutter_app/screens/favorite_screen.dart';
import 'package:flutter_app/screens/home_screen.dart';
import 'package:flutter_app/screens/quotes_screen.dart';

import 'helper/database.dart';

void main() async{

  // await dbh.initDB();
  // await dbh.deleteAllData();

  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Future deleteData()async{
    await dbh.initDB();
    await dbh.initFVDB();
    await dbh.deleteAllData();
    await myApi.getdataApi();
  }

  @override
  void initState() {

    deleteData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          caption: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),
          headline1: TextStyle(fontWeight: FontWeight.w500,color: Colors.white,fontSize: 16,letterSpacing: 1),
        ),
      ),
      routes: {
        "/" : (context) => HomeScreen(),
        "/quotes_screen" : (context) => QuotesScreen(),
        "/favorite_screen" : (context) => FavoriteScreen(),
      },
    );
  }
}
