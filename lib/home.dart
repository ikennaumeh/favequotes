import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'card.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

//  List <Quotes> quoteList = [
//    Quotes(text: 'There was no where to go but \neverywhere, so just keep on \n rolling with the    stars.', author: 'Jack Kerouac'),
//    Quotes(
//      text: 'The toad does not run in \nthe daytime for nothing', author: 'Chinua Achebe'),
//  Quotes(text: 'A hungry man too dey vex', author: 'Ikenna Umeh'),
//  Quotes(text: 'Wetin concern naked \nman with pocket', author: 'Unknown'),
//    Quotes(text: 'Wetin no go see for \ngate', author: 'Unknown'),
//    Quotes(text: 'This life no balance', author: 'Unknown'),];

    void getData() async {
       http.Response response = await http.get('https://type.fit/api/quotes');
       if(response.statusCode == 200){
         String data = response.body;
         listOfItems = jsonDecode(data);
         String text = jsonDecode(data)[0]['text'];
         String author = jsonDecode(data)[0]['author'];
         print(text);
         print(author);
       } else {
         print(response.statusCode);
       }

    }

    List listOfItems = [];

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
                      'Your favourites',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height - 120.0,

                      child: ListView.builder(

                        shrinkWrap: true,
                         itemCount:listOfItems.length,
                        itemBuilder: (context, index){
                           return DefaultCard(text: '${listOfItems[index]["text"]}',//quoteList[index].text,
                             author: '${listOfItems[index]["author"]}',
                           );

                        },
                      ),
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


//class Quotes{
//  final String text;
//  final String author;
//
//  Quotes({this.text, this.author});
//
//}

class Quotes{
  final String text;
  final String author;

  Quotes({this.text, this.author});
}