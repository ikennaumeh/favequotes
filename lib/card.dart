import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class DefaultCard extends StatefulWidget {
  final String text;
  final String author;

  const DefaultCard(
      {Key key,
        this.text,
        this.author,})
      : super(key: key);

  @override
  _DefaultCardState createState() => _DefaultCardState();
}

class _DefaultCardState extends State<DefaultCard> {
  bool setColor = false;

  @override
  Widget build(BuildContext context) {
    return Card(

      elevation: 5.0,
      color: Colors.white,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.text,
                    style: TextStyle(
                      fontSize: 16.5,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '- ${widget.author}',
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(70.0),
                    topRight: Radius.circular(5.0),),

                  ),
                   height: 100.0,
                  width: 110.0,
                  child: Image.asset('assets/images/icon1.jpeg',

                    alignment: Alignment.topRight,
                    fit: BoxFit.cover,),

                ),

                Row(

                  children: <Widget>[
                    SizedBox(width: 45.0,),
                    IconButton(
                      icon: Icon(Icons.favorite_border),
                      onPressed: (){},


                    ),
                    SizedBox(width: 3.0,),
                    IconButton(
                      icon: Icon(Icons.share,),
                      onPressed: (){
                        Share.share('Share favourites quotes');
                      },
                    ),
                  ],
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }
}