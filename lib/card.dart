import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DefaultCard extends StatelessWidget {
  final String text;
  final String author;

  const DefaultCard(
      {Key key,
        this.text,
        this.author,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      color: Colors.white,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  text,
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
                  '- $author',
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
          Column(
            children: <Widget>[
              Image.asset('assets/images/icon1.jpeg',
              width: 75.0,
              height: 100.0,),
              SizedBox(
                height: 5.0,
              ),
              Row(

                children: <Widget>[
                  Icon(Icons.favorite, color: Colors.orange,),
                  SizedBox(width: 10.0,),
                  Icon(Icons.share,),
                ],
              ),
              SizedBox(height: 5.0,),
            ],
          ),

        ],
      ),
    );
  }
}