import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'card.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    Duration time = Duration(seconds: 5);

    Future.delayed(time, (){
      Navigator.pushNamed(context, '/homescreen');
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'fave',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 35.0,
                ),
              ),
              TextSpan(
                text: 'QUOTES',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.yellowAccent,
                  fontSize: 40.0,

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


    Future<dynamic> getData() async {
       http.Response response = await http.get('https://type.fit/api/quotes');
       if(response.statusCode == 200){
         String data = response.body;
         setState(() {
           listOfItems = jsonDecode(data);
         });

       } else {
         print(response.statusCode);
       }


    }

    List listOfItems;

    @override
  void initState() {
    // TODO: implement initState
      getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,

      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(padding: EdgeInsets.all(10),
          child: ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0),),
            child: Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0, top: 45.0, right: 20.0, bottom: 20.0,),
                    child: Text(
                      'Quotes',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height - 150.0,
                      child: listOfItems != null ? ListView.builder(
                        shrinkWrap: true,
                        itemCount:listOfItems.length,
                        itemBuilder: (context, index){
                          return DefaultCard(text: '${listOfItems[index]["text"]}',
                            author: '${listOfItems[index]["author"]}',
                          );
                        },
                      )
                          : Center(child: CircularProgressIndicator(),)
                    ),


                  ),
                ],
              ),
            ),
          ),),
        ),
      ),
    );
  }
}


