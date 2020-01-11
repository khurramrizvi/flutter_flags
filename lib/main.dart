import 'dart:convert';
import 'flag.dart';

import 'detail_flag.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Flags",
    home: FlagApp(),
    theme: ThemeData(
      accentColor: Colors.black,
      primaryColor: Colors.black,
      secondaryHeaderColor: Colors.black12,
      indicatorColor: Colors.black
    ),
  ));
}

class FlagApp extends StatefulWidget {
  @override
  _FlagAppState createState() => _FlagAppState();
}

class _FlagAppState extends State<FlagApp> {

  List data;

  Future<List<Flag>> _getFlags() async{
    var data = await DefaultAssetBundle.of(context).loadString('json/flag_data.json');

    var jsonData = jsonDecode(data.toString());

    List<Flag> flags = [];

    for(var f in jsonData){
      Flag flag = Flag(f['name'],f['emoji'],f['unicode'],f['code'],f['title'],f['index']);
      flags.add(flag);
    }

    return flags;
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 12,
        centerTitle: true,
        title: Text("F L A G S",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20
          ),
        ),
      ),

      body: Container(
        child: Center(
          child: FutureBuilder(
            future: _getFlags(),
            builder: (BuildContext context, AsyncSnapshot snapshot){

              if(snapshot.data == null){
                return CircularProgressIndicator();
              }else{
              return ListView.builder(
                padding: EdgeInsets.all(16),
                itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index){
                    return ListTile(
                      leading: Text(snapshot.data[index].emoji,style: TextStyle(
                        fontSize: 40
                      ),),
                      title: Text(snapshot.data[index].name,style: TextStyle(
                        fontWeight: FontWeight.w600
                      ),),
                      subtitle: Text(snapshot.data[index].unicode),
                      trailing: Text(snapshot.data[index].code,
                        textScaleFactor: 1.2,
                        style: TextStyle(fontWeight: FontWeight.w500),),
                      contentPadding: EdgeInsets.only(bottom: 8),
                      onTap:() {
                        Navigator
                            .push(context,
                            new MaterialPageRoute(
                                builder: (context) => DetailPage(snapshot.data[index])
                            )
                      );
                      },
                    );
                  }
              );
            }
          }
          ),
        ),
      )
    );
  }
}
