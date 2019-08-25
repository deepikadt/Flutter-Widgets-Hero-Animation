

// showDialog(
//                 context: context,
//                 builder: (BuildContext context) {
//                   // return object of type Dialog
//                   return AlertDialog(
//                     title: new Text("Alert Dialog title"),
//                     content: new Text("Alert Dialog body"),
//                     actions: <Widget>[
//                       // usually buttons at the bottom of the dialog
//                       new FlatButton(
//                         child: new Text("Close"),
//                         onPressed: () {
//                           Navigator.of(context).pop();
//                         },
//                       ),
//                     ],
//                   );
//                 },
//               );



//a back button to navigating to previous screen with customization
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