import 'package:flutter/material.dart';
import 'flag.dart';


class DetailPage extends StatelessWidget {
  
  final Flag flag;
  DetailPage(this.flag);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top:80),
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(50),
                  child: Center(
                    child: Text(flag.emoji,textScaleFactor: 6.5,)
                  ),
              ),

              Text(flag.title,style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 30
              ),),

              Divider(
                color: Colors.black87,
              ),


              Padding(
                padding: EdgeInsets.all(8),
              ),
              

              Text(flag.unicode,style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20
              ),),

              Padding(
                padding: EdgeInsets.all(8),
              ),

              Text(flag.code,style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 32
              ),),

            ],
          )
      ),
      
    );
  }
}


