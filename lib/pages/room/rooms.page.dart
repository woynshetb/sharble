import 'package:flutter/material.dart';
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
      "icon": "assets/images/icon_bag.png",
    },
    {
      "name": "Vacation Trip 2021 & Student \nLoans",
      "total": "12",
      "image": "assets/images/girl.png",
      "color": Color(0xffE7FEFF),
      "icon": "assets/images/icon_add.png",
    },
    {
      "name": "Mike owing me money for a long \ntime",
      "total": "12",
      "image": "assets/images/girl.png",
      "icon": "assets/images/icon_wallet.png",
      "color": Color(0xffFFE7E7)
    },
    {
      "name": "Movies and Shows to watch this \nsimmer",
      "total": "12",
      "image": "assets/images/girl.png",
      "color": Color(0xffF7E7FF),
      "icon": "assets/images/icon_food.png",
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
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        title: Text(
          "Rooms",
          style: TextStyle(
              color: Theme.of(context).textTheme.bodyText1!.color,
              fontWeight: FontWeight.bold,
              fontSize: 18),
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
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
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
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
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            list[index]['name'],
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w900,
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
                          Row(
                            children: [
                              Container(
                                width: deviceSize.width * 0.05,
                                height: deviceSize.height * 0.05,
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
                                width: deviceSize.width * 0.05,
                                height: deviceSize.height * 0.05,
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
                                radius: 12,
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
                      CircleAvatar(
                        radius: 35,
                        backgroundColor: list[index]['color'],
                        child: Container(
                          width: deviceSize.width * 0.08,
                          height: deviceSize.height * 0.08,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: AssetImage(list[index]['icon']))),
                        ),
                      )
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
