import 'package:flutter/material.dart';

class FavouritePage extends StatefulWidget {
  @override
  _FavouritePageState createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
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
                  crossAxisAlignment: CrossAxisAlignment.stretch,

                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 45.0, right: 40.0, bottom: 20.0,),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          IconButton(icon: Icon(Icons.arrow_back),
                            onPressed: (){
                              Navigator.pop(context);
                            },),
                          Text(
                            'Favourite quotes',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 30.0,
                            ),
                          ),
                        ],
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
