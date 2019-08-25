import 'dart:ui' as prefix0;

import 'package:educational_app/history.dart';
import 'package:flutter/material.dart';

class CategoryDetail extends StatelessWidget {
  int index;

  CategoryDetail(this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: CustomScrollView(
        slivers: <Widget>[
          _descriptionHeader(context, index),
          SliverFillRemaining(
            child: _description(context),
          ),
        ],
      ),
    );
  }
}

Widget _descriptionHeader(BuildContext context, int index) {
  return SliverAppBar(
    backgroundColor: Colors.purple,
    expandedHeight: 250,  
    elevation: 0,
    leading: Container(),
    // leading: GestureDetector(
    //   child: Padding(
    //     child: Container(
    //       margin: const EdgeInsets.all(10),
    //       decoration: BoxDecoration(
    //           color: Colors.white,
    //           shape: BoxShape.rectangle,
    //           borderRadius: BorderRadius.all(Radius.circular(10))),
    //       alignment: Alignment.center,
    //       child: Icon(Icons.navigate_before, color: Colors.black, size: 20),
    //     ),
    //     padding: const EdgeInsets.all(5),
    //   ),
    //   onTap: () {
    //     Navigator.maybePop(context);
    //   },
    // ),
    flexibleSpace: FlexibleSpaceBar(
      titlePadding: const EdgeInsets.symmetric(horizontal: 20),
      title: Container(
        child: Text(
          'Digital Painting: From'
          ' Sketch to Finished Product',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        width: 230,
       
      ),
      background: _backgroundDescriptionHeader(index),
    ),
  );
}

Widget _backgroundDescriptionHeader(int index) {
  return Container(
    color: Colors.purple,
    child: Stack(
      children: <Widget>[
        Hero(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/illustration_pro_02.png'),
                  fit: BoxFit.cover),
            ),
            height: 267,
            width: 400,
          ),
          tag: 'categoryItem_' '${index.toString()}',
          transitionOnUserGestures: true,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: ClipRect(
            child: SizedBox(
              width: 400,
              height: 65,
              child: BackdropFilter(
                filter: prefix0.ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          blurRadius: 5, color: Colors.purple.withOpacity(0.1)),
                    ],
                    color: Colors.purple.withOpacity(0.1),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _description(BuildContext context) {
  return Padding(
    child: Column(
      children: <Widget>[
        Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                'Description',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            )),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Description is the pattern of narrative development'
              ' that aims to make vivid a place, object, character, or group. Description '
              'is one of four rhetorical modes, along with exposition, argumentation, and narration. '
              'In practice it would be difficult to write literature that drew on just one of the four basic modes.'
              'In practice it would be difficult to write literature that drew on just one of the four basic modes.',
              style: TextStyle(
                color: Colors.white,
                height: 1.5,
                fontSize: 14,
              ),
            ),
          ),
        ),
        Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'Language',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'English',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        child: Icon(
                          Icons.star,
                          color: Colors.white70,
                          size: 20,
                        ),
                        padding: const EdgeInsets.only(right: 5),
                      ),
                      Text(
                        '26',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Icon(
                          Icons.star,
                          color: Colors.white70,
                          size: 20,
                        ),
                      ),
                      Padding(
                        child: Text(
                          '2hr',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        padding: const EdgeInsets.only(left: 5),
                      ),
                      Text(
                        '000',
                        style: TextStyle(
                          color: Colors.purple.withOpacity(0),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 80),
              child: GestureDetector(
                child: Container(
                  width: 80,
                  height: 70,
                  padding: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  alignment: Alignment.centerRight,
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Enroll Now',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),
                      Icon(
                        Icons.navigate_next,
                        color: Colors.black,
                        size: 10,
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => History()));
                },
              ),
            ),
          ],
        )
      ],
    ),
    padding: const EdgeInsets.symmetric(horizontal: 20),
  );
}
