import 'package:educational_app/categoryDetail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Educationl App',
      theme: ThemeData(primaryColor: Colors.white, accentColor: Colors.grey),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePage createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  int currentItemIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListTile(
                contentPadding: const EdgeInsets.only(right: 0),
                leading: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                trailing: Icon(
                  Icons.radio_button_checked,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'START LEARN',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                maxLines: 1,
                cursorColor: Colors.grey,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
                decoration: InputDecoration(
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(vertical: 2),
                    fillColor: Colors.white,
                    hintText: 'search',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                    border: OutlineInputBorder(
                        gapPadding: 10,
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1,
                        )),
                    disabledBorder: OutlineInputBorder(
                        gapPadding: 10,
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1,
                        )),
                    enabledBorder: OutlineInputBorder(
                        gapPadding: 10,
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1,
                        )),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'All Category',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ),
            _allCategoryList(),
            _showCategoryData(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Popular',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ),
            _popularList(),
          ],
        ),
      ),
    );
  }

  Widget _popularList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (BuildContext buildContext, int index) {
          return _popularListItem();
        },
      ),
    );
  }

  Widget _popularListItem() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: 0),
        leading: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/illustration_pro_02.png'),
                fit: BoxFit.cover),
          ),
          width: 70,
        ),
        title: Column(
          children: <Widget>[
            Align(
              child: Text(
                'Photoshop 200 Masterclass',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
              alignment: Alignment.topLeft,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Align(
                  child: Text(
                    'Photoshop masterclass will give opportunity '
                    'to learn photoshop key skills .',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                  alignment: Alignment.centerLeft),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 2),
                  child: Icon(
                    Icons.star,
                    color: Colors.white70,
                    size: 15,
                  ),
                ),
                Text(
                  '26',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 7),
                  child: Icon(
                    Icons.star,
                    color: Colors.white70,
                    size: 15,
                  ),
                ),
                Padding(
                  child: Text(
                    '2hr',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                  padding: const EdgeInsets.only(left: 2),
                )
              ],
            ),
          ],
        ),
        trailing: Align(
          child: Icon(
            Icons.more_horiz,
            color: Colors.white,
          ),
          alignment: Alignment.topRight,
          widthFactor: 1,
        ),
      ),
    );
  }

  Widget _allCategoryList() {
    List<String> categoryList = <String>[
      'Graphic Design',
      'Programming',
      'E commerce',
      'Marketing',
      'Marketing'
    ];

    return Container(
      height: 50,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        itemBuilder: (BuildContext buildContext, int index) {
          return CustomWidget(
            index: index,
            isSelected: currentItemIndex == index,
            onSelect: () {
              setState(() {
                currentItemIndex = index;
              });
            },
            item: categoryList[index],
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Padding(
          padding: const EdgeInsets.only(left: 15),
        ),
      ),
    );
  }

  Widget _showCategoryData() {
    return Container(
      height: 150,
      child: ListView.builder(
          padding: const EdgeInsets.only(left: 20),
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (BuildContext buildContext, int index) {
            return _showCategoryDataItem(index);
          }),
    );
  }

  Widget _showCategoryDataItem(int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CategoryDetail(index)));
      },
      child: Padding(padding: const EdgeInsets.only(right: 20),
              child: Container(
          color: Colors.purpleAccent,
          width: 110,
          child: Column(
            children: <Widget>[
              Hero(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/illustration_pro_02.png'),
                        fit: BoxFit.cover),
                  ),
                  height: 105,
                ),
                tag: 'categoryItem_' '${index.toString()}',
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Text(
                        'Painting',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Icon(
                        Icons.more_vert,
                        color: Colors.white,
                        size: 10,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 2),
                      child: Icon(
                        Icons.star,
                        color: Colors.white70,
                        size: 13,
                      ),
                    ),
                    Text(
                      '26',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 7),
                      child: Icon(
                        Icons.star,
                        color: Colors.white70,
                        size: 13,
                      ),
                    ),
                    Text(
                      '2hr',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//custom widget to maintain the clicks on the all category items
class CustomWidget extends StatefulWidget {
  final int index;
  final bool isSelected;
  final VoidCallback onSelect;
  final String item;

  const CustomWidget({
    Key key,
    @required this.index,
    @required this.isSelected,
    @required this.onSelect,
    @required this.item,
  })  : assert(index != null),
        assert(isSelected != null),
        assert(onSelect != null),
        assert(item != null),
        super(key: key);

  @override
  _CustomWidget createState() => _CustomWidget(index, item);
}

class _CustomWidget extends State<CustomWidget> {
  int currentIndex = 0;
  String item;

  _CustomWidget(this.currentIndex, this.item);

  @override
  Widget build(BuildContext context) {
    // Manage clicks for category items
    return GestureDetector(
      onTap: widget.onSelect,
      child: Column(
        children: <Widget>[
          Text(
            item,
            style: widget.isSelected
                ? TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)
                : TextStyle(
                    color: Colors.white60,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
          ),
          Align(
            alignment: Alignment.center,
            child: widget.isSelected
                ? Icon(
                    Icons.linear_scale,
                    color: Colors.white,
                  )
                : null,
          ),
        ],
      ),
    );
  }
}
