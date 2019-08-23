import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const int FROM = 0;
const int TO = 1;
const String orderAZ = 'A to Z';
const String orderZA = 'Z to A';

const String JAN01 = '01';
const String FEB02 = '02';
const String MAR03= '03';
const String APR04 = '04';
const String MAY05 = '05';
const String JUN06= '06';
const String JUL07 = '07';
const String AUG08 = '08';
const String SEP09 = '09';
const String OCT10 = '10';
const String NOV11 = '11';
// const String DEC12 = '12';

const String JAN = 'Jan';
const String FEB = 'Feb';
const String MAR = 'Mar';
const String APR = 'Apr';
const String MAY = 'May';
const String JUN = 'Jun';
const String JUL = 'Jul';
const String AUG = 'Aug';
const String SEP = 'Sep';
const String OCT = 'Oct';
const String NOV = 'Nov';
const String DEC = 'Dec';

//enum is used in PopUpButton
enum Order { AtoZ, ZtoA }
//list is sorted on the basis of sorting order
String sortingOrder = orderAZ;

class History extends StatefulWidget {
  @override
  _History createState() => _History();
}

class _History extends State<History> {
  int _index = 0;
  //size of the list
  int size = 8;
  String dateFrom = convertDateToString(DateTime.now());
  String dateTo = convertDateToString(DateTime.now());
  List<HistoryDetail> list = historyList();

  @override
  Widget build(BuildContext context) {
    // TODO: history screen
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'History',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          GestureDetector(
              child: Padding(
                child: Center(
                  child: Text(
                    'Reset Filter',
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                padding: const EdgeInsets.only(right: 8),
              ),
              onTap: () {
                resetFilter();
              }),
        ],
      ),
      body: SafeArea(
        child: _seeHistory(context),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: onTabTabbed,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/icNavBarDocumentActive.png'),
            activeIcon: Image.asset('assets/icNavBarDocumentActive.png'),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icNavBarScanInactive.png'),
            activeIcon: Image.asset('assets/icNavBarScanInactive.png'),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icNavBarProfileInactive.png'),
            activeIcon: Image.asset('assets/icNavBarProfileInactive.png'),
            title: SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  //method to reset the filter
  void resetFilter() {
    setState(() {
      dateFrom = convertDateToString(DateTime.now());
      dateTo = convertDateToString(DateTime.now());
      sortingOrder = orderAZ;
      sortList(list);
    });
  }

  //open calender to pick date
  Future<DateTime> _selectDate(BuildContext context, int type) async {
    DateTime date = DateTime.now();

    if (type == FROM)
      date = convertStringToDateTime(dateFrom);
    else
      date = convertStringToDateTime(dateTo);

    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: type==FROM?DateTime(2001):convertStringToDateTime(dateFrom),
      lastDate: type==TO?DateTime.now():convertStringToDateTime(dateTo),
    );

    if (picked != null && picked != date) {
      setState(() {
        date = picked;

        if (type == FROM)
          dateFrom = convertDateToString(date);
        else
          dateTo = convertDateToString(date);
      });
    }
    return date;

  }

//used in bottom navigation
  void onTabTabbed(int i) {
    setState(() {
      _index = i;
      print('${i.toString()}');
    });
  }

//method to create body of the screen
  Widget _seeHistory(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          child: _filters(context),
          height: 60,
          color: Color.fromARGB(255, 27, 49, 68),
        ),
        Expanded(
          child: Container(
            color: Color.fromARGB(255, 243, 247, 252),
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: size,
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext buildContext, int index) {
                return _historyItem(index);
              },
            ),
          ),
        ),
      ],
    );
  }

//creating widget for each list item
  Widget _historyItem(int index) {
    HistoryDetail historyDetail = list[index];
    String name = historyDetail.name;
    String day = historyDetail.day;
    String time = historyDetail.time;

    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Container(
        color: Colors.white,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: ListTile(
          title: Padding(
            child: Text(
              name,
              style: TextStyle(
                  color: Color.fromARGB(255, 27, 49, 68),
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            padding: const EdgeInsets.only(top: 15),
          ),
          subtitle: Padding(
            child: Row(
              children: <Widget>[
                Text(
                  day,
                  style: TextStyle(
                      fontSize: 14, color: Color.fromARGB(255, 95, 95, 95)),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      foregroundColor: Colors.grey,
                      radius: 4,
                    )),
                Text(
                  time,
                  style: TextStyle(
                      fontSize: 14, color: Color.fromARGB(255, 95, 95, 95)),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(vertical: 12),
          ),
        ),
      ),
    );
  }

//creating widget for the filters
  Widget _filters(BuildContext context) {
    return Padding(
      child: Row(
        children: <Widget>[
          Padding(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'From',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  child: Container(
                    margin: const EdgeInsets.only(top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              dateFrom,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                            Padding(
                              child: Image.asset('assets/icSmallCalander.png'),
                              padding: const EdgeInsets.only(left: 10),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Container(
                            child: Divider(
                              color: Colors.white60,
                              height: 1,
                            ),
                            width: 95,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    _selectDate(context, FROM);
                  },
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 25),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'To',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                child: Container(
                  margin: const EdgeInsets.only(top: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            dateTo,
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          Padding(
                            child: Image.asset('assets/icSmallCalander.png'),
                            padding: const EdgeInsets.only(left: 10),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Container(
                          child: Divider(
                            color: Colors.white60,
                            height: 1,
                          ),
                          width: 95,
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  _selectDate(context, TO);
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: VerticalDivider(
              color: Colors.white60,
              width: 1,
              indent: 2,
              endIndent: 2,
            ),
          ),
          PopupMenuButton<Order>(
            onSelected: (Order order) {
              setState(() {
                if (order == Order.AtoZ) {
                  sortingOrder = orderAZ;
                  sortList(list);
                } else {
                  sortingOrder = orderZA;
                  sortList(list);
                }
                print(sortingOrder);
              });
            },
            child: Container(
              child: Row(
                children: <Widget>[
                  Text(
                    sortingOrder,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Image.asset('assets/icMobileDropDown.png'),
                  ),
                ],
              ),
            ),
            padding: const EdgeInsets.all(0),
            //icon: Icon(Icons.arrow_drop_down, color: Colors.white),
            itemBuilder: (context) => <PopupMenuEntry<Order>>[
              PopupMenuItem(
                child: Text(orderAZ),
                enabled: true,
                value: Order.AtoZ,
              ),
              PopupMenuItem(
                child: Text(orderZA),
                enabled: true,
                value: Order.ZtoA,
              ),
            ],
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 10),
    );
  }
}

//mmodel class for list
class HistoryDetail {
  String name;
  String day;
  String time;
  HistoryDetail(this.name, this.day, this.time);
}

//a list used for showing in the history
List<HistoryDetail> historyList() {
  List<HistoryDetail> list = List();

  HistoryDetail historyDetail1 =
      HistoryDetail('A D A Developer', 'Yesterday', '9:30 AM');
  HistoryDetail historyDetail2 =
      HistoryDetail('B D A Developer', 'Yesterday', '9:30 AM');
  HistoryDetail historyDetail =
      HistoryDetail('C D A Developer', 'Yesterday', '9:30 AM');
  HistoryDetail historyDetail3 =
      HistoryDetail('D D A Developer', 'Yesterday', '9:30 AM');
  HistoryDetail historyDetail4 =
      HistoryDetail('E D A Developer', 'Yesterday', '9:30 AM');
  HistoryDetail historyDetail5 =
      HistoryDetail('E D A Developer', 'Yesterday', '9:30 AM');
  HistoryDetail historyDetail6 =
      HistoryDetail('A D A Developer', 'Yesterday', '9:30 AM');
  HistoryDetail historyDetail7 =
      HistoryDetail('B D A Developer', 'Yesterday', '9:30 AM');

  list.add(historyDetail);
  list.add(historyDetail1);
  list.add(historyDetail2);
  list.add(historyDetail3);
  list.add(historyDetail4);
  list.add(historyDetail5);
  list.add(historyDetail6);
  list.add(historyDetail7);
  return list;
}

//method to sort the list
void sortList(List<HistoryDetail> list) {
  if (sortingOrder == orderAZ) {
    list.sort((a, b) => (a.name.toLowerCase()).compareTo(b.name.toLowerCase()));
  } else {
    list.sort((a, b) => (b.name.toLowerCase()).compareTo(a.name.toLowerCase()));
  }
}

//convert date name shown on screen to DateTime object
  DateTime convertStringToDateTime(String date) {
   
    String formattedDate = '20' +
        date.substring(8, 10) +
        getMonthNumber(date.substring(0, 3) )+
        date.substring(4, 6);

    DateTime formattedParsedDate = DateTime.parse(formattedDate);
    return formattedParsedDate;
  }

//convert DateTime object to String
   String convertDateToString(DateTime date) {
    String dateSelected = date.toString();

    String selectedDate = getMonthName(dateSelected.substring(5, 7)) +
        ' ' +
        dateSelected.substring(8, 10) +
        ', ' +
        dateSelected.substring(2, 4);

    print(selectedDate);

    return selectedDate;
  }

//to get the week to show in the screen
   String getMonthName(String month) {
    if (month == JAN01)
      return JAN;
    else if (month == FEB02)
      return FEB;
    else if (month == MAR03)
      return MAR;
    else if (month == APR04)
      return APR;
    else if (month == MAY05)
      return MAY;
    else if (month == JUN06)
      return JUN;
    else if (month == JUL07)
      return JUL;
    else if (month == AUG08)
      return AUG;
    else if (month == SEP09)
      return SEP;
    else if (month == OCT10)
      return OCT;
    else if (month == NOV11)
      return NOV;
    else if (month == DEC12) return DEC;
  }

//to get the month number to set date in calender
   String getMonthNumber(String month) {
    if (month == JAN)
      return JAN01;
    else if (month == FEB)
      return FEB02;
    else if (month == MAR)
      return MAR03;
    else if (month == APR)
      return APR04;
    else if (month == MAY)
      return MAY05;
    else if (month == JUN)
      return JUN06;
    else if (month == JUL)
      return JUL07;
    else if (month == AUG)
      return AUG08;
    else if (month == SEP)
      return SEP09;
    else if (month == OCT)
      return OCT10;
    else if (month == NOV)
      return NOV11;
    else if (month == DEC) return DEC12;
  }