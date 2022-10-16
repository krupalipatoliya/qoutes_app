import 'dart:convert';
import 'package:flutter_app/helper/database.dart';
import 'package:flutter_app/models/quotes.dart';
import 'package:http/http.dart' as http;

class Api{

  static const String startPoint = "zenquotes.io";
  static const String endPoint = "api/quotes/cb122a2967977f41baac439a30338071aec8efd1";

  Api._();

  Future getdataApi()async{

    await dbh.initDB();
    await dbh.deleteAllData();

    http.Response response = await http.get(Uri.https(startPoint, endPoint));

    if(response.statusCode == 200){
      print("successful");
      List l = await jsonDecode(response.body);
      print(l.runtimeType);
      List dataList = l.map((e) => Quotes.fromJson(e)).toList();

      dataList.forEach((element) async{
        await dbh.saveData(element);
        print(1);
      });

    }else{
      print("error");
    }
  }

}

Api myApi = Api._();