import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sharble/pages/notifications/notifications.page.dart';
import 'package:sharble/pages/room/create_room.page.dart';
import 'package:sharble/pages/shopping/shopping_list.page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _customTileExpanded = true;
  bool haveRoom = true;

  String dropdownvalue = 'Add to List';

  // List of items in our dropdown menu
  var items = ['Add to List', 'Edit', 'Remove'];

  @override
  List<dynamic> lists = [
    {
      "title": "Home Grocery",
      "child": [],
    },
  ];
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leadingWidth: 30,
        titleSpacing: 0,
        backgroundColor: Color(0xffFCFBFC),
        elevation: 0,
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Text(
            "Home",
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyText1!.color,
              fontWeight: FontWeight.w900,
              fontSize: 18,
            ),
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              setState(() {
                haveRoom = !haveRoom;
              });
            },
            child: Image.asset(
              "assets/images/icon_search.png",
              width: deviceSize.width * 0.04,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) =>
                      NotificationsPage(),
                  transitionDuration: Duration.zero,
                  reverseTransitionDuration: Duration.zero,
                ),
              );
            },
            child: Image.asset(
              "assets/images/icon_notifications.png",
              width: deviceSize.width * 0.04,
            ),
          ),
          const SizedBox(
            width: 23,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Visibility(
        visible: haveRoom == false,
        child: Container(
          margin: EdgeInsets.only(bottom: deviceSize.height * 0.02),
          child: FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColor,
            elevation: 0,
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) =>
                      CreatRoomPage(),
                  transitionDuration: Duration.zero,
                  reverseTransitionDuration: Duration.zero,
                ),
              );
            },
          ),
        ),
      ),
      body: haveRoom
          ? Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              margin: const EdgeInsets.only(left: 5, right: 10),
              child: ListView(
                children: [
                  Theme(
                    data: Theme.of(context)
                        .copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      initiallyExpanded: true,
                      title: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation1, animation2) =>
                                  ShoppingListPage(),
                              transitionDuration: Duration.zero,
                              reverseTransitionDuration: Duration.zero,
                            ),
                          );
                        },
                        child: const Text(
                          "Home Grocery",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ),
                      trailing: Container(
                        alignment: Alignment.centerRight,
                        width: 150,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            //                 fit:BoxFit.contain,
                            // width:26,
                            // height: 26,

                            SvgPicture.asset(
                              "assets/images/assets/icon_shopping_list.svg",
                              fit: BoxFit.contain,
                              width: 26,
                              height: 26,
                            ),

                            SizedBox(
                              width: 10,
                            ),

                            InkWell(
                              child: SvgPicture.asset(
                                _customTileExpanded
                                    ? "assets/images/assets/icon-nav-button-bottom.svg"
                                    : "assets/images/assets/icon-nav-button-top.svg",
                                fit: BoxFit.contain,
                                width: 26,
                                height: 26,
                              ),
                            ),
                          ],
                        ),
                      ),
                      onExpansionChanged: (bool expanded) {
                        setState(() => _customTileExpanded = expanded);
                      },
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade100,
                                blurRadius:
                                    50, // has the effect of softening the shadow
                                spreadRadius:
                                    1, // has the effect of extending the shadow
                                offset: Offset(
                                  5.0, // horizontal, move right 10
                                  5.0, // vertical, move down 10
                                ),
                              )
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Beans",
                                    style: TextStyle(
                                      color: Color(0xff2E3553),
                                      fontFamily: "Gilroy",
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  Text(
                                    "1pics",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              Row(children: [
                                Text("Tasco"),
                                SizedBox(
                                  width: 8,
                                ),
                                CustomDropDown(
                                  show: true,
                                  items: items,
                                  bgColor: Color(0xffE7FFE8),
                                  valueUrl:
                                      "assets/images/assets/icon-button-shopping-list.svg",
                                )
                              ]),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade100,
                                blurRadius:
                                    50, // has the effect of softening the shadow
                                spreadRadius:
                                    1, // has the effect of extending the shadow
                                offset: Offset(
                                  5.0, // horizontal, move right 10
                                  5.0, // vertical, move down 10
                                ),
                              )
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Beans",
                                    style: TextStyle(
                                      color: Color(0xff2E3553),
                                      fontFamily: "Gilroy",
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "1pics",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text("Tasco"),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  CustomDropDown(
                                    show: true,
                                    items: items,
                                    bgColor: Color(0xffE7FFE8),
                                    valueUrl:
                                        "assets/images/assets/icon-button-shopping-list.svg",
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade100,
                                blurRadius:
                                    50, // has the effect of softening the shadow
                                spreadRadius:
                                    1, // has the effect of extending the shadow
                                offset: Offset(
                                  5.0, // horizontal, move right 10
                                  5.0, // vertical, move down 10
                                ),
                              )
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Beans",
                                    style: TextStyle(
                                      color: Color(0xff2E3553),
                                      fontFamily: "Gilroy",
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "1pics",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("Tasco"),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  CustomDropDown(
                                    show: true,
                                    items: items,
                                    bgColor: Color(0xffE7FFE8),
                                    valueUrl:
                                        "assets/images/assets/icon-button-shopping-list.svg",
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade100,
                                blurRadius:
                                    50, // has the effect of softening the shadow
                                spreadRadius:
                                    1, // has the effect of extending the shadow
                                offset: Offset(
                                  5.0, // horizontal, move right 10
                                  5.0, // vertical, move down 10
                                ),
                              )
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Beans",
                                    style: TextStyle(
                                      color: Color(0xff2E3553),
                                      fontFamily: "Gilroy",
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "1pics",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("Tasco"),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  CustomDropDown(
                                    show: true,
                                    items: items,
                                    bgColor: Color(0xffE7FFE8),
                                    valueUrl:
                                        "assets/images/assets/icon-button-shopping-list.svg",
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Theme(
                    data: Theme.of(context)
                        .copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      initiallyExpanded: true,
                      title: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation1, animation2) =>
                                  ShoppingListPage(),
                              transitionDuration: Duration.zero,
                              reverseTransitionDuration: Duration.zero,
                            ),
                          );
                        },
                        child: Text(
                          "Shared apartment tasks",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ),
                      trailing: Container(
                        alignment: Alignment.center,
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            //                 fit:BoxFit.contain,
                            // width:26,
                            // height: 26,

                            SvgPicture.asset(
                              "assets/images/assets/icon-task-manager.svg",
                              fit: BoxFit.contain,
                              width: 26,
                              height: 26,
                            ),

                            SizedBox(
                              width: 10,
                            ),

                            InkWell(
                              child: SvgPicture.asset(
                                _customTileExpanded
                                    ? "assets/images/assets/icon-nav-button-bottom.svg"
                                    : "assets/images/assets/icon-nav-button-top.svg",
                                fit: BoxFit.contain,
                                width: 26,
                                height: 26,
                              ),
                            ),
                          ],
                        ),
                      ),
                      onExpansionChanged: (bool expanded) {
                        setState(() => _customTileExpanded = expanded);
                      },
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade100,
                                blurRadius:
                                    50, // has the effect of softening the shadow
                                spreadRadius:
                                    1, // has the effect of extending the shadow
                                offset: const Offset(
                                  5.0, // horizontal, move right 10
                                  5.0, // vertical, move down 10
                                ),
                              )
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Need to Clean the room",
                                    style: TextStyle(
                                      color: Color(0xff2E3553),
                                      fontFamily: "Gilroy",
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: deviceSize.width * 0.05,
                                        height: deviceSize.width * 0.05,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                fit: BoxFit.contain,
                                                image: AssetImage(
                                                    "assets/images/girl.png"))),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Visibility(
                                        visible: true,
                                        child: Container(
                                          width: deviceSize.width * 0.05,
                                          height: deviceSize.width * 0.05,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  fit: BoxFit.contain,
                                                  image: AssetImage(
                                                      "assets/images/girl.png"))),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Visibility(
                                        visible: true,
                                        child: Container(
                                          width: deviceSize.width * 0.05,
                                          height: deviceSize.width * 0.05,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  fit: BoxFit.contain,
                                                  image: AssetImage(
                                                      "assets/images/girl.png"))),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  CustomDropDown(
                                      items: items,
                                      valueUrl:
                                          "assets/images/assets/icon-button-task-manager.svg",
                                      bgColor: Color(0xffE7FEFF)),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text("Tomorrow"),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade100,
                                blurRadius:
                                    50, // has the effect of softening the shadow
                                spreadRadius:
                                    1, // has the effect of extending the shadow
                                offset: Offset(
                                  5.0, // horizontal, move right 10
                                  5.0, // vertical, move down 10
                                ),
                              )
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Need to Clean the room",
                                    style: TextStyle(
                                      color: Color(0xff2E3553),
                                      fontFamily: "Gilroy",
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: deviceSize.width * 0.05,
                                        height: deviceSize.width * 0.05,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                fit: BoxFit.contain,
                                                image: AssetImage(
                                                    "assets/images/girl.png"))),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Visibility(
                                        visible: true,
                                        child: Container(
                                          width: deviceSize.width * 0.05,
                                          height: deviceSize.width * 0.05,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  fit: BoxFit.contain,
                                                  image: AssetImage(
                                                      "assets/images/girl.png"))),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Visibility(
                                        visible: true,
                                        child: Container(
                                          width: deviceSize.width * 0.05,
                                          height: deviceSize.width * 0.05,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  fit: BoxFit.contain,
                                                  image: AssetImage(
                                                      "assets/images/girl.png"))),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  CustomDropDown(
                                      items: items,
                                      valueUrl:
        "assets/images/assets/icon-button-task-manager.svg",
                                      bgColor: Color(0xffE7FEFF)),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text("Tomorrow"),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade100,
                                blurRadius:
                                    50, // has the effect of softening the shadow
                                spreadRadius:
                                    1, // has the effect of extending the shadow
                                offset: Offset(
                                  5.0, // horizontal, move right 10
                                  5.0, // vertical, move down 10
                                ),
                              )
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Need to Clean the room",
                                    style: TextStyle(
                                      color: Color(0xff2E3553),
                                      fontFamily: "Gilroy",
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: deviceSize.width * 0.05,
                                        height: deviceSize.width * 0.05,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                fit: BoxFit.contain,
                                                image: AssetImage(
                                                    "assets/images/girl.png"))),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Visibility(
                                        visible: false,
                                        child: Container(
                                          width: deviceSize.width * 0.05,
                                          height: deviceSize.width * 0.05,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  fit: BoxFit.contain,
                                                  image: AssetImage(
                                                      "assets/images/girl.png"))),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Visibility(
                                        visible: false,
                                        child: Container(
                                          width: deviceSize.width * 0.05,
                                          height: deviceSize.width * 0.05,
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  fit: BoxFit.contain,
                                                  image: AssetImage(
                                                      "assets/images/girl.png"))),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  CustomDropDown(
                                      items: items,
                                      valueUrl:
        "assets/images/assets/icon-button-task-manager.svg",
                                      bgColor: Color(0xffE7FEFF)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text("Tomorrow"),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Theme(
                    data: Theme.of(context)
                        .copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      initiallyExpanded: true,
                      title: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation1, animation2) =>
                                  ShoppingListPage(),
                              transitionDuration: Duration.zero,
                              reverseTransitionDuration: Duration.zero,
                            ),
                          );
                        },
                        child: const Text(
                          "Owing a lot of money",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ),
                      onExpansionChanged: (bool expanded) {
                        setState(() => _customTileExpanded = expanded);
                      },
                      trailing: Container(
                        alignment: Alignment.center,
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            //                 fit:BoxFit.contain,
                            // width:26,
                            // height: 26,

                            SvgPicture.asset(
                              "assets/images/assets/icon-dept-organizer.svg",
                              fit: BoxFit.contain,
                              width: 26,
                              height: 26,
                            ),

                            SizedBox(
                              width: 10,
                            ),

                            InkWell(
                              child: SvgPicture.asset(
                                _customTileExpanded
                                    ? "assets/images/assets/icon-nav-button-bottom.svg"
                                    : "assets/images/assets/icon-nav-button-top.svg",
                                fit: BoxFit.contain,
                                width: 26,
                                height: 26,
                              ),
                            ),
                          ],
                        ),
                      ),
                      children: [
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade100,
                                blurRadius:
                                    50, // has the effect of softening the shadow
                                spreadRadius:
                                    1, // has the effect of extending the shadow
                                offset: Offset(
                                  5.0, // horizontal, move right 10
                                  5.0, // vertical, move down 10
                                ),
                              )
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Borrowing Money for \nschool trip and launch ",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: "Gilroy",
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  RichText(
                                    overflow: TextOverflow.clip,
                                    textAlign: TextAlign.end,
                                    textDirection: TextDirection.rtl,
                                    softWrap: true,
                                    textScaleFactor: 1,
                                    text: TextSpan(
                                      text: 'Dept accepted\n by ',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Color(0xff2E3553),
                                        fontFamily: "Gilroy",
                                      ),
                                      children: const <TextSpan>[
                                        TextSpan(
                                            text: 'Lina Cocona',
                                            style: TextStyle(
                                              color: Color(0xff2E3553),
                                              fontFamily: "Gilroy",
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: deviceSize.height * 0.01,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RichText(
                                    overflow: TextOverflow.clip,
                                    textAlign: TextAlign.end,
                                    textDirection: TextDirection.rtl,
                                    softWrap: true,
                                    textScaleFactor: 1,
                                    text: TextSpan(
                                      text: 'Paid',
                                      style: TextStyle(
                                        color: Color(0xff2E3553),
                                        fontSize: deviceSize.width * 0.03,
                                        fontFamily: "Gilroy",
                                      ),
                                      children: const <TextSpan>[
                                        TextSpan(
                                            text: ' \$50',
                                            style: TextStyle(
                                              color: Color(0xff2E3553),
                                              fontFamily: "Gilroy",
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ],
                                    ),
                                  ),
                                  RichText(
                                    overflow: TextOverflow.clip,
                                    textAlign: TextAlign.end,
                                    textDirection: TextDirection.rtl,
                                    softWrap: true,
                                    textScaleFactor: 1,
                                    text: TextSpan(
                                      text: 'from',
                                      style: TextStyle(
                                        color: Color(0xff2E3553),
                                        fontSize: deviceSize.width * 0.03,
                                        fontFamily: "Gilroy",
                                      ),
                                      children: const <TextSpan>[
                                        TextSpan(
                                            text: ' \$100',
                                            style: TextStyle(
                                              color: Color(0xff2E3553),
                                              fontFamily: "Gilroy",
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: deviceSize.height * 0.002,
                              ),
                              Center(
                                child: Stack(
                                  children: [
                                    Container(
                                      width: deviceSize.width,
                                      height: 2,
                                      decoration: BoxDecoration(
                                        color: Color(0xffF4F4F4),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                    ),
                                    LayoutBuilder(
                                      builder: (context, constraints) =>
                                          Container(
                                        width:
                                            constraints.maxWidth * (50 / 100),
                                        height: 2,
                                        decoration: BoxDecoration(
                                          color: Color(0xff48BFAA),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(0)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: deviceSize.height * 0.007,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RichText(
                                    overflow: TextOverflow.clip,
                                    textAlign: TextAlign.end,
                                    textDirection: TextDirection.rtl,
                                    softWrap: true,
                                    textScaleFactor: 1,
                                    text: TextSpan(
                                      text: 'Started: ',
                                      style: TextStyle(
                                        color: Color(0xff2E3553),
                                        fontFamily: "Gilroy",
                                        fontSize: deviceSize.width * 0.028,
                                      ),
                                      children: const <TextSpan>[
                                        TextSpan(
                                            text: '12.12.2022',
                                            style: TextStyle(
                                              color: Color(0xff2E3553),
                                              fontFamily: "Gilroy",
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ],
                                    ),
                                  ),
                                  RichText(
                                    overflow: TextOverflow.clip,
                                    textAlign: TextAlign.end,
                                    textDirection: TextDirection.rtl,
                                    softWrap: true,
                                    textScaleFactor: 1,
                                    text: TextSpan(
                                      text: 'Deadline: ',
                                      style: TextStyle(
                                        color: Color(0xff2E3553),
                                        fontFamily: "Gilroy",
                                        fontSize: deviceSize.width * 0.028,
                                      ),
                                      children: const <TextSpan>[
                                        TextSpan(
                                            text: '12.09.2023',
                                            style: TextStyle(
                                              color: Color(0xff2E3553),
                                              fontFamily: "Gilroy",
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade100,
                                blurRadius:
                                    50, // has the effect of softening the shadow
                                spreadRadius:
                                    1, // has the effect of extending the shadow
                                offset: Offset(
                                  5.0, // horizontal, move right 10
                                  5.0, // vertical, move down 10
                                ),
                              )
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Borrowing Money for \nschool trip and launch ",
                                    style: TextStyle(
                                      color: Color(0xff2E3553),
                                      fontFamily: "Gilroy",
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  RichText(
                                    overflow: TextOverflow.clip,
                                    textAlign: TextAlign.end,
                                    textDirection: TextDirection.rtl,
                                    softWrap: true,
                                    textScaleFactor: 1,
                                    text: TextSpan(
                                      text: 'Dept accepted\n by ',
                                      style: TextStyle(
                                        color: Color(0xff2E3553),
                                        fontFamily: "Gilroy",
                                        fontSize: deviceSize.width * 0.028,
                                      ),
                                      children: const <TextSpan>[
                                        TextSpan(
                                            text: 'Lina Cocona',
                                            style: TextStyle(
                                              color: Color(0xff2E3553),
                                              fontFamily: "Gilroy",
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: deviceSize.height * 0.01,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RichText(
                                    overflow: TextOverflow.clip,
                                    textAlign: TextAlign.end,
                                    textDirection: TextDirection.rtl,
                                    softWrap: true,
                                    textScaleFactor: 1,
                                    text: TextSpan(
                                      text: 'Paid',
                                      style: TextStyle(
                                        color: Color(0xff2E3553),
                                        fontSize: deviceSize.width * 0.03,
                                        fontFamily: "Gilroy",
                                      ),
                                      children: const <TextSpan>[
                                        TextSpan(
                                            text: ' \$50',
                                            style: TextStyle(
                                              color: Color(0xff2E3553),
                                              fontFamily: "Gilroy",
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ],
                                    ),
                                  ),
                                  RichText(
                                    overflow: TextOverflow.clip,
                                    textAlign: TextAlign.end,
                                    textDirection: TextDirection.rtl,
                                    softWrap: true,
                                    textScaleFactor: 1,
                                    text: TextSpan(
                                      text: 'from',
                                      style: TextStyle(
                                        color: Color(0xff2E3553),
                                        fontSize: deviceSize.width * 0.03,
                                        fontFamily: "Gilroy",
                                      ),
                                      children: const <TextSpan>[
                                        TextSpan(
                                            text: ' \$100',
                                            style: TextStyle(
                                              color: Color(0xff2E3553),
                                              fontFamily: "Gilroy",
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: deviceSize.height * 0.002,
                              ),
                              Center(
                                child: Stack(
                                  children: [
                                    Container(
                                      width: deviceSize.width,
                                      height: 2,
                                      decoration: BoxDecoration(
                                        color: Color(0xffF4F4F4),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                    ),
                                    LayoutBuilder(
                                      builder: (context, constraints) =>
                                          Container(
                                        width:
                                            constraints.maxWidth * (50 / 100),
                                        height: 2,
                                        decoration: BoxDecoration(
                                          color: Color(0xff48BFAA),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(0)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: deviceSize.height * 0.007,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RichText(
                                    overflow: TextOverflow.clip,
                                    textAlign: TextAlign.end,
                                    textDirection: TextDirection.rtl,
                                    softWrap: true,
                                    textScaleFactor: 1,
                                    text: TextSpan(
                                      text: 'Started: ',
                                      style: TextStyle(
                                        color: Color(0xff2E3553),
                                        fontFamily: "Gilroy",
                                        fontSize: deviceSize.width * 0.028,
                                      ),
                                      children: const <TextSpan>[
                                        TextSpan(
                                            text: '12.12.2022',
                                            style: TextStyle(
                                              color: Color(0xff2E3553),
                                              fontFamily: "Gilroy",
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ],
                                    ),
                                  ),
                                  RichText(
                                    overflow: TextOverflow.clip,
                                    textAlign: TextAlign.end,
                                    textDirection: TextDirection.rtl,
                                    softWrap: true,
                                    textScaleFactor: 1,
                                    text: TextSpan(
                                      text: 'Deadline: ',
                                      style: TextStyle(
                                        color: Color(0xff2E3553),
                                        fontFamily: "Gilroy",
                                        fontSize: deviceSize.width * 0.028,
                                      ),
                                      children: const <TextSpan>[
                                        TextSpan(
                                            text: '12.09.2023',
                                            style: TextStyle(
                                              color: Color(0xff2E3553),
                                              fontFamily: "Gilroy",
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade100,
                                blurRadius:
                                    50, // has the effect of softening the shadow
                                spreadRadius:
                                    1, // has the effect of extending the shadow
                                offset: Offset(
                                  5.0, // horizontal, move right 10
                                  5.0, // vertical, move down 10
                                ),
                              )
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Borrowing Money for \nschool trip and launch ",
                                    style: TextStyle(
                                      color: Color(0xff2E3553),
                                      fontFamily: "Gilroy",
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  RichText(
                                    overflow: TextOverflow.clip,
                                    textAlign: TextAlign.end,
                                    textDirection: TextDirection.rtl,
                                    softWrap: true,
                                    textScaleFactor: 1,
                                    text: TextSpan(
                                      text: 'Dept accepted\n by ',
                                      style: TextStyle(
                                        color: Color(0xff2E3553),
                                        fontFamily: "Gilroy",
                                        fontSize: deviceSize.width * 0.028,
                                      ),
                                      children: const <TextSpan>[
                                        TextSpan(
                                            text: 'Lina Cocona',
                                            style: TextStyle(
                                              color: Color(0xff2E3553),
                                              fontFamily: "Gilroy",
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: deviceSize.height * 0.01,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RichText(
                                    overflow: TextOverflow.clip,
                                    textAlign: TextAlign.end,
                                    textDirection: TextDirection.rtl,
                                    softWrap: true,
                                    textScaleFactor: 1,
                                    text: TextSpan(
                                      text: 'Paid',
                                      style: TextStyle(
                                        color: Color(0xff2E3553),
                                        fontSize: deviceSize.width * 0.03,
                                        fontFamily: "Gilroy",
                                      ),
                                      children: const <TextSpan>[
                                        TextSpan(
                                            text: ' \$50',
                                            style: TextStyle(
                                              color: Color(0xff2E3553),
                                              fontFamily: "Gilroy",
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ],
                                    ),
                                  ),
                                  RichText(
                                    overflow: TextOverflow.clip,
                                    textAlign: TextAlign.end,
                                    textDirection: TextDirection.rtl,
                                    softWrap: true,
                                    textScaleFactor: 1,
                                    text: TextSpan(
                                      text: 'from',
                                      style: TextStyle(
                                        color: Color(0xff2E3553),
                                        fontSize: deviceSize.width * 0.03,
                                        fontFamily: "Gilroy",
                                      ),
                                      children: const <TextSpan>[
                                        TextSpan(
                                            text: ' \$100',
                                            style: TextStyle(
                                              color: Color(0xff2E3553),
                                              fontFamily: "Gilroy",
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: deviceSize.height * 0.002,
                              ),
                              Center(
                                child: Stack(
                                  children: [
                                    Container(
                                      width: deviceSize.width,
                                      height: 2,
                                      decoration: BoxDecoration(
                                        color: Color(0xffF4F4F4),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                    ),
                                    LayoutBuilder(
                                      builder: (context, constraints) =>
                                          Container(
                                        width:
                                            constraints.maxWidth * (50 / 100),
                                        height: 2,
                                        decoration: BoxDecoration(
                                          color: Color(0xff48BFAA),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(0)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: deviceSize.height * 0.007,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RichText(
                                    overflow: TextOverflow.clip,
                                    textAlign: TextAlign.end,
                                    textDirection: TextDirection.rtl,
                                    softWrap: true,
                                    textScaleFactor: 1,
                                    text: TextSpan(
                                      text: 'Started: ',
                                      style: TextStyle(
                                        color: Color(0xff2E3553),
                                        fontFamily: "Gilroy",
                                        fontSize: deviceSize.width * 0.028,
                                      ),
                                      children: const <TextSpan>[
                                        TextSpan(
                                            text: '12.12.2022',
                                            style: TextStyle(
                                              color: Color(0xff2E3553),
                                              fontFamily: "Gilroy",
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ],
                                    ),
                                  ),
                                  RichText(
                                    overflow: TextOverflow.clip,
                                    textAlign: TextAlign.end,
                                    textDirection: TextDirection.rtl,
                                    softWrap: true,
                                    textScaleFactor: 1,
                                    text: TextSpan(
                                      text: 'Deadline: ',
                                      style: TextStyle(
                                        color: Color(0xff2E3553),
                                        fontFamily: "Gilroy",
                                        fontSize: deviceSize.width * 0.028,
                                      ),
                                      children: const <TextSpan>[
                                        TextSpan(
                                            text: '12.09.2023',
                                            style: TextStyle(
                                              color: Color(0xff2E3553),
                                              fontFamily: "Gilroy",
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Theme(
                    data: Theme.of(context)
                        .copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      initiallyExpanded: true,
                      onExpansionChanged: (bool expanded) {
                        setState(() => _customTileExpanded = expanded);
                      },
                      title: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation1, animation2) =>
                                  ShoppingListPage(),
                              transitionDuration: Duration.zero,
                              reverseTransitionDuration: Duration.zero,
                            ),
                          );
                        },
                        child: const Text(
                          "Owing a lot of money",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ),
                      trailing: Container(
                        alignment: Alignment.center,
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            //                 fit:BoxFit.contain,
                            // width:26,
                            // height: 26,

                            SvgPicture.asset(
                              "assets/images/assets/icon-dept-organizer.svg",
                              fit: BoxFit.contain,
                              width: 26,
                              height: 26,
                            ),

                            SizedBox(
                              width: 10,
                            ),

                            InkWell(
                              child: SvgPicture.asset(
                                _customTileExpanded
                                    ? "assets/images/assets/icon-nav-button-bottom.svg"
                                    : "assets/images/assets/icon-nav-button-top.svg",
                                fit: BoxFit.contain,
                                width: 26,
                                height: 26,
                              ),
                            ),
                          ],
                        ),
                      ),
                      children: [
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade100,
                                blurRadius:
                                    50, // has the effect of softening the shadow
                                spreadRadius:
                                    1, // has the effect of extending the shadow
                                offset: Offset(
                                  5.0, // horizontal, move right 10
                                  5.0, // vertical, move down 10
                                ),
                              )
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Black Panter",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "1pics",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    width: deviceSize.width * 0.05,
                                    height: deviceSize.width * 0.05,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          fit: BoxFit.contain,
                                          image: AssetImage(
                                              "assets/images/girl.png"),
                                        )),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      Text("Netflix"),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      CustomDropDown(
                                          items: items,
                                          valueUrl:
                                              "assets/images/assets/icon-button-activity-planner.svg",
                                          bgColor: Color(0xffF7E7FF)),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Text("Tomorrow"),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade100,
                                blurRadius:
                                    50, // has the effect of softening the shadow
                                spreadRadius:
                                    1, // has the effect of extending the shadow
                                offset: Offset(
                                  5.0, // horizontal, move right 10
                                  5.0, // vertical, move down 10
                                ),
                              )
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Black Panter",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "1pics",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    width: deviceSize.width * 0.05,
                                    height: deviceSize.width * 0.05,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            fit: BoxFit.contain,
                                            image: AssetImage(
                                                "assets/images/girl.png"))),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      Text("Netflix"),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      CustomDropDown(
                                          items: items,
                                          valueUrl:
            "assets/images/assets/icon-button-activity-planner.svg",
                                          bgColor: Color(0xffF7E7FF)),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Text("Tomorrow"),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade100,
                                blurRadius:
                                    50, // has the effect of softening the shadow
                                spreadRadius:
                                    1, // has the effect of extending the shadow
                                offset: Offset(
                                  5.0, // horizontal, move right 10
                                  5.0, // vertical, move down 10
                                ),
                              )
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Black Panter",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "1pics",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    width: deviceSize.width * 0.05,
                                    height: deviceSize.width * 0.05,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            fit: BoxFit.contain,
                                            image: AssetImage(
                                                "assets/images/girl.png"))),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      const Text("Netflix"),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      CustomDropDown(
                                          items: items,
                                          valueUrl:
                                          "assets/images/assets/icon-button-activity-planner.svg",
                                          bgColor: Color(0xffF7E7FF)),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Text("Tomorrow"),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Theme(
                    data: Theme.of(context)
                        .copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      title: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation1, animation2) =>
                                  ShoppingListPage(),
                              transitionDuration: Duration.zero,
                              reverseTransitionDuration: Duration.zero,
                            ),
                          );
                        },
                        child: const Text(
                          "Buying stuff for next summer",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ),
                      trailing: Container(
                        alignment: Alignment.center,
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            //                 fit:BoxFit.contain,
                            // width:26,
                            // height: 26,

                            SvgPicture.asset(
                              "assets/images/assets/icon_shopping_list.svg",
                              fit: BoxFit.contain,
                              width: 26,
                              height: 26,
                            ),

                            SizedBox(
                              width: 10,
                            ),

                            InkWell(
                              child: SvgPicture.asset(
                                _customTileExpanded
                                    ? "assets/images/assets/icon-nav-button-bottom.svg"
                                    : "assets/images/assets/icon-nav-button-top.svg",
                                fit: BoxFit.contain,
                                width: 26,
                                height: 26,
                              ),
                            ),
                          ],
                        ),
                      ),
                      children: [
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade100,
                                blurRadius:
                                    50, // has the effect of softening the shadow
                                spreadRadius:
                                    1, // has the effect of extending the shadow
                                offset: Offset(
                                  5.0, // horizontal, move right 10
                                  5.0, // vertical, move down 10
                                ),
                              )
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Black Panter",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "1pics",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    width: deviceSize.width * 0.05,
                                    height: deviceSize.width * 0.05,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            fit: BoxFit.contain,
                                            image: AssetImage(
                                                "assets/images/girl.png"))),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      Text("Netflix"),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      CustomDropDown(
                                          items: items,
                                          valueUrl:
                                              "assets/images/assets/icon-button-room-activity-manager.svg",
                                          bgColor: Color(0xffF7E7FF)),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Text("Tomorrow"),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade100,
                                blurRadius:
                                    50, // has the effect of softening the shadow
                                spreadRadius:
                                    1, // has the effect of extending the shadow
                                offset: Offset(
                                  5.0, // horizontal, move right 10
                                  5.0, // vertical, move down 10
                                ),
                              )
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Black Panter",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "1pics",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    width: deviceSize.width * 0.05,
                                    height: deviceSize.width * 0.05,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            fit: BoxFit.contain,
                                            image: AssetImage(
                                                "assets/images/girl.png"))),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      Text("Netflix"),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      CustomDropDown(
                                          items: items,
                                          valueUrl:
                                              "assets/images/assets/icon-button-room-activity-manager.svg",
                                          bgColor: Color(0xffF7E7FF)),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Text("Tomorrow"),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade100,
                                blurRadius:
                                    50, // has the effect of softening the shadow
                                spreadRadius:
                                    1, // has the effect of extending the shadow
                                offset: Offset(
                                  5.0, // horizontal, move right 10
                                  5.0, // vertical, move down 10
                                ),
                              )
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Black Panter",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "1pics",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    width: deviceSize.width * 0.05,
                                    height: deviceSize.width * 0.05,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            fit: BoxFit.contain,
                                            image: AssetImage(
                                                "assets/images/girl.png"))),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      const Text("Netflix"),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      CustomDropDown(
                                          items: items,
                                          valueUrl:
                                              "assets/images/assets/icon-button-room-activity-manager.svg",
                                          bgColor: Color(0xffF7E7FF)),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Text("Tomorrow"),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Theme(
                    data: Theme.of(context)
                        .copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      title: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation1, animation2) =>
                                  ShoppingListPage(),
                              transitionDuration: Duration.zero,
                              reverseTransitionDuration: Duration.zero,
                            ),
                          );
                        },
                        child: const Text(
                          "People owe me",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ),
                      trailing: Container(
                        alignment: Alignment.center,
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            //                 fit:BoxFit.contain,
                            // width:26,
                            // height: 26,

                            SvgPicture.asset(
                              "assets/images/assets/icon-dept-organizer.svg",
                              fit: BoxFit.contain,
                              width: 26,
                              height: 26,
                            ),

                            SizedBox(
                              width: 10,
                            ),

                            InkWell(
                              child: SvgPicture.asset(
                                _customTileExpanded
                                    ? "assets/images/assets/icon-nav-button-bottom.svg"
                                    : "assets/images/assets/icon-nav-button-top.svg",
                                fit: BoxFit.contain,
                                width: 26,
                                height: 26,
                              ),
                            ),
                          ],
                        ),
                      ),
                      children: [],
                    ),
                  ),
                ],
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: deviceSize.width,
                  height: deviceSize.height * 0.55,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/home_image.png'),
                        fit: BoxFit.cover),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(
                        // left: deviceSize.width * 0.05,
                        // right: deviceSize.height * 0.04,
                        ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: deviceSize.height * 0.02,
                        ),
                        SvgPicture.asset(
                          "assets/images/Sharble.svg",
                          height: 23,
                          width: 88,
                        ),
                        SizedBox(
                          height: deviceSize.height * 0.04,
                        ),
                        const Text(
                          "You do not have any room yet.  Rooms are spaces \nwhere you can invite friends to join and share that \nspace. You can create multiple rooms with different \nmodules like Shopping List, Money, Tasks or \nEntertainment.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(
                          height: deviceSize.height * 0.02,
                        ),
                        const Text(
                          "Create your first room by clicking in the plus button \n and invite friends to join.",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 13),
                        ),
                        SizedBox(
                          height: deviceSize.height * 0.02,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation1, animation2) =>
                                        CreatRoomPage(),
                                transitionDuration: Duration.zero,
                                reverseTransitionDuration: Duration.zero,
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              ),
                              color: const Color.fromRGBO(255, 255, 255, 1),
                              border: Border.all(
                                color: Color.fromRGBO(72, 191, 169, 1),
                                width: 1,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const Text(
                                  'Create your room',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color.fromRGBO(46, 53, 83, 1),
                                      fontFamily: 'Gilroy',
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      height: 1.6),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

class CustomDropDown extends StatelessWidget {
  String? valueUrl;
  Color? bgColor;
  bool? show;
  CustomDropDown(
      {Key? key,
      required this.items,
      required this.valueUrl,
      required this.bgColor,
      this.show = false})
      : super(key: key);

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        child: PopupMenuButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          color: bgColor,
          elevation: 0,
          child: SvgPicture.asset(
            valueUrl!,
            width: 26,
            height: 26,
            fit: BoxFit.contain,
          ),
          itemBuilder: (context) {
            return List.generate(
              items.length,
              (index) => PopupMenuItem(
                onTap: () async {
                  // await AuthServices.setLocale(
                  //     AppLanguages.languages[index].code);

                  // await translator.setNewLanguage(
                  //   context,
                  //   newLanguage: AppLanguages.languages[index].code,
                  //   remember: true,
                  //   restart: true,
                  // );
                  // String savedLocal = await AuthServices.getLocale();
                  // setState(() {
                  //   saveindex = AppLanguages.languages
                  //       .indexWhere((element) => element.code == savedLocal);
                  // });
                },
                child: Container(
                  child: Row(
                    children: [
                      items[index] == "Add to List" ||
                              items[index] == "Completed"
                          ? SvgPicture.asset(
                              "assets/images/assets/icon-completed-blue.svg",
                              width: 15,
                              height: 15,
                              fit: BoxFit.contain,
                            )
                          : items[index] == "Edit"
                              ? SvgPicture.asset(
                                  "assets/images/assets/Icon.svg",
                                  width: 15,
                                  height: 15,
                                  fit: BoxFit.contain,
                                )
                              : SvgPicture.asset(
                                  "assets/images/assets/icon-bin-blue.svg",
                                  width: 15,
                                  height: 15,
                                  fit: BoxFit.contain,
                                ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        items[index],
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
