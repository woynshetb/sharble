import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sharble/components/widgets/buttons.dart';
import 'package:sharble/components/widgets/custom.appbar.dart';
import 'package:sharble/components/widgets/forms.dart';
import 'package:sharble/pages/room/room_detail.page.dart';
import 'package:sharble/services/validator.service.dart';

class CreatRoomPage extends StatefulWidget {
  const CreatRoomPage({Key? key}) : super(key: key);

  @override
  State<CreatRoomPage> createState() => _CreatRoomPageState();
}

class _CreatRoomPageState extends State<CreatRoomPage> {
  List<Map> list = [
    {
      "name": "Shopping List",
      "description":
          "Share your shopping list with multiple people. Don’t miss anything from now.",
      "image": "assets/images/assets/icon_shopping_list.svg",
      "color": Color(0xffE7FFE8)
    },
    {
      "name": "Task Manager",
      "description":
          "Share tasks with your friends and make them do things they should do.",
      "image": "assets/images/assets/icon-task-manager.svg",
      "color": Color(0xffE7FEFF)
    },
    {
      "name": "Dept Organizer",
      "description":
          "Create dept contracts between two people. Remind them when payment is overdue.",
      "image": "assets/images/assets/icon-dept-organizer.svg",
      "color": Color(0xffFFE7E7)
    },
    {
      "name": "Activity Planner",
      "description":
          "Share your shopping list with multiple people. Don’t miss anything from now.",
      "image": "assets/images/assets/icon-activity-planner.svg",
      "color": Color(0xffF7E7FF)
    },
  ];

  int clickedIndex = 5;
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
         backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: Color(0xffffffff),
        titleSpacing: 0,
        elevation: 0,
        // leadingWidth: 50,
        leading: InkWell(
          onTap: () => {Navigator.of(context).maybePop()},
          child: Container(
            margin: const EdgeInsets.only(
              right: 15,
              top: 10,
              bottom: 10,
              left: 15,
            ),
            decoration: const BoxDecoration(
                color: Color(0xffF5F5F5), shape: BoxShape.circle),
            child: SvgPicture.asset(
              "assets/images/assets/icon-nav-button-back.svg",
              width: 26,
              height: 26,
              fit: BoxFit.contain,
            ),
          ),
        ),
        centerTitle: false,
        title: Text(
          "Create room",
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Theme.of(context).textTheme.bodyText1!.color,
            fontSize: 14,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(children: [
   Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Room Name",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            DefaultField(
              validator: (value) => FormValidator.validateName(value!),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "Select which module you want to activate for this room. You can select only one module at a time.",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Expanded(
                flex: 0,
                child: ListView.builder(
                    itemCount: list.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            clickedIndex = index;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(15),
                          margin: EdgeInsets.only(
                            top: 10,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: clickedIndex == index
                                ? Border.all(
                                    color: Theme.of(context).primaryColor,
                                    width: 1)
                                : Border.all(color: Colors.white, width: 1),
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
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    list[index]['name'],
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  InkWell(
                                    child: SvgPicture.asset(
                                      list[index]['image'],
                                      width: 22,
                                      height: 22,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                list[index]['description'],
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    })),
            SizedBox(
              height: 15,
            ),
            Text(
              "More cool and fun modules coming soon",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w300,
              ),
            ),
            ],),
           
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: GreenPostitve(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) =>
                            RoomDetail(),
                        transitionDuration: Duration.zero,
                        reverseTransitionDuration: Duration.zero,
                      ),
                    );
                  },
                  title: "Next"),
            )
          ],
        ),
      ),
    );
  }
}
