import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sharble/pages/notifications/notifications.page.dart';
import 'package:sharble/pages/room/create_room.page.dart';
import 'package:sharble/pages/shopping/shopping_list.page.dart';

class RoomsPage extends StatefulWidget {
  const RoomsPage({Key? key}) : super(key: key);

  @override
  State<RoomsPage> createState() => _RoomsPageState();
}

class _RoomsPageState extends State<RoomsPage> {
  List<Map> list = [
    {
      "name": "Home Grocery",
      "total": "12",
      "image": "assets/images/girl.png",
      "color": Color(0xffE7FFE8),
      "icon": "assets/images/assets/icon_shopping_list.svg",
    },
    {
      "name": "Vacation Trip 2021 & Student \nLoans",
      "total": "12",
      "image": "assets/images/girl.png",
      "color": Color(0xffE7FEFF),
      "icon": "assets/images/assets/icon-task-manager.svg",
    },
    {
      "name": "Mike owing me money for a long \ntime",
      "total": "12",
      "image": "assets/images/girl.png",
      "icon": "assets/images/assets/icon-dept-organizer.svg",
      "color": Color(0xffFFE7E7)
    },
    {
      "name": "Movies and Shows to watch this \nsimmer",
      "total": "12",
      "image": "assets/images/girl.png",
      "color": Color(0xffF7E7FF),
      "icon": "assets/images/assets/icon-activity-planner.svg",
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
        backgroundColor: Color(0xfffcfbfc),
        elevation: 0,
        centerTitle: false,
        title: Text(
          "Rooms",
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyText1!.color,
            fontWeight: FontWeight.w900,
            fontSize: 16,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Image.asset(
              "assets/images/icon_search.png",
              width: deviceSize.width * 0.04,
            ),
          ),
          SizedBox(
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
          SizedBox(
            width: 23,
          ),
        ],
      ),
      backgroundColor: Color(0xffFCFBFC),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20,
        ),
        child: ListView.builder(
            itemCount: list.length,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return InkWell(
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
                child: Container(
                  
                  margin: EdgeInsets.only(top: 2, bottom: 8),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 25, // has the effect of softening the shadow
                        spreadRadius:
                            1, // has the effect of extending the shadow
                        offset: Offset(
                          6, // horizontal, move right 10
                          6, // vertical, move down 10
                        ),
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            list[index]['name'],
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                list[index]['total'],
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "open Items",
                                style: TextStyle(),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Container(
                                width:20,
                                height: 20,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.contain,
                                        image:
                                            AssetImage(list[index]['image']))),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                               width:20,
                                height: 20,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.contain,
                                        image:
                                            AssetImage(list[index]['image']))),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              CircleAvatar(
                                radius: 10,
                                child: Text(
                                  "TM",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 8),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SvgPicture.asset(
                        list[index]['icon'],
                        fit: BoxFit.contain,
                        width: 65,
                        height: 65,
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: deviceSize.height * 0.02),
        child: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0,
          child: Icon(
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
    );
  }
}
