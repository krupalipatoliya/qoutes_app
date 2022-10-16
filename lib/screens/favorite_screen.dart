import 'dart:io';
import 'dart:math';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/helper/database.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';
import 'dart:ui' as ui;

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  bool isBool = true;
  List dataList = [];
  List<int> imgNumber = [];
  List img = [
    "assets/images/1.jpg",
    "assets/images/2.jpg",
    "assets/images/3.jpg",
    "assets/images/4.jpg",
    "assets/images/5.jpg",
  ];

  getUpdateData()async{
    setState(() {

    dataList = dbh.getDataFVDB();
    });
  }

  takeData()async{
    await dbh.initFVDB();
    dataList = await dbh.getDataFVDB();
    setState(() {
      isBool = true;
      for(int i=0;i<dataList.length;i++){
        imgNumber.add(Random().nextInt(img.length));
      }
    });
  }

  @override
  void initState() {

    takeData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    String title = ModalRoute.of(context).settings.arguments;
    List listOfGlobalKey = List.generate(dataList.length, (index) => GlobalKey());

    shareAsImage(var key) async {
      RenderRepaintBoundary boundary =
      key.currentContext.findRenderObject();

      ui.Image image = await boundary.toImage(pixelRatio: 3);
      ByteData byteData =
      await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngImg = byteData.buffer.asUint8List();

      var directory = await getTemporaryDirectory();
      File imgFile = File("${directory.path}/my_img.png");
      await imgFile.writeAsBytes(pngImg);
      await Share.shareFiles([imgFile.path]);
    }

    Future saveImage(var key) async {
      RenderRepaintBoundary boundary =
      key.currentContext.findRenderObject();

      ui.Image image = await boundary.toImage(pixelRatio: 3);
      ByteData byteData =
      await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngImg = byteData.buffer.asUint8List();

      var directory = await getApplicationDocumentsDirectory();
      File file = File("${directory.path}/my_image.png");
      await file.writeAsBytes(pngImg);
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Downloaded Successfully ... ")));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(color: Colors.black54),
        ),
        leading: IconButton(
          icon: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          color: Colors.black,
          iconSize: 25,
        ),
        backgroundColor: Colors.white,
      ),
      body:(isBool)? ListView.separated(
        itemCount: dataList.length,
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Material(
              elevation: 10,
              borderRadius: BorderRadius.circular(15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.5,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(10, 10),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      RepaintBoundary(
                        key: listOfGlobalKey[i],
                        child: Stack(
                          children: [
                            SizedBox.expand(
                              child: Image.asset(
                                img[imgNumber[i]],
                                fit: BoxFit.fill,
                                colorBlendMode: BlendMode.darken,
                              ),
                            ),
                            SizedBox.expand(
                              child: Material(
                                color: Colors.black26,
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: MediaQuery.of(context)
                                        .size
                                        .width /
                                        8),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      dataList[i].quotes,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                          letterSpacing: 2),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: 20),
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            "~",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 24,
                                                letterSpacing: 2),
                                          ),
                                          Text(
                                            dataList[i].author,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 24,
                                                letterSpacing: 2),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (imgNumber[i] == 4) {
                                      imgNumber[i] = 0;
                                    } else {
                                      imgNumber[i]++;
                                    }
                                  });
                                },
                                icon: Icon(
                                  Icons.camera,
                                  color: Colors.lightGreenAccent,
                                ),
                                iconSize: 35,
                              ),
                              IconButton(
                                onPressed: () async {
                                  await FlutterClipboard.copy(dataList[i].quotes);
                                  ScaffoldMessenger.of(context)
                                      .removeCurrentSnackBar();
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    SnackBar(
                                      content: Text("${dataList[i].quotes} is copied"),
                                    ),
                                  );
                                },
                                icon: Icon(
                                  Icons.copy,
                                  color: Colors.blue,
                                ),
                                iconSize: 35,
                              ),
                              PopupMenuButton(
                                elevation: 10,
                                icon: Icon(
                                  Icons.share,
                                  color: Colors.red,
                                ),
                                iconSize: 35,
                                onSelected: (val) async {
                                  if (val == 0) {
                                    await Share.share(
                                        dataList[i].quotes);
                                  } else {
                                    await shareAsImage(listOfGlobalKey[i]);
                                  }
                                },
                                itemBuilder: (context) {
                                  return [
                                    PopupMenuItem(
                                      child: Text("Share as Text"),
                                      value: 0,
                                    ),
                                    PopupMenuItem(
                                      child: Text("Share as Image"),
                                      value: 1,
                                    ),
                                  ];
                                },
                              ),
                              IconButton(
                                onPressed: () async {
                                  await saveImage(listOfGlobalKey[i]);
                                },
                                icon: Icon(
                                  Icons.download_rounded,
                                  color: Colors.green,
                                ),
                                iconSize: 35,
                              ),
                              IconButton(
                                onPressed: () async{
                                  await dbh.deleteFVDBDATA(dataList[i].id);
                                  await getUpdateData();
                                },
                                icon: Icon(
                                  Icons.star,
                                  color: Colors.amberAccent,
                                ),
                                iconSize: 35,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, i) {
          return SizedBox(height: 20);
        },
      ) : CircularProgressIndicator(),
    );
  }
}
