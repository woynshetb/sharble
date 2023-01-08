import 'package:flutter/material.dart';
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
      "image": "assets/images/icon_bag.png",
      "color": Color(0xffE7FFE8)
    },
    {
      "name": "Task Manager",
      "description":
          "Share tasks with your friends and make them do things they should do.",
      "image": "assets/images/icon_add.png",
      "color": Color(0xffE7FEFF)
    },
    {
      "name": "Dept Organizer",
      "description":
          "Create dept contracts between two people. Remind them when payment is overdue.",
      "image": "assets/images/icon_wallet.png",
      "color": Color(0xffFFE7E7)
    },
    {
      "name": "Activity Planner",
      "description":
          "Share your shopping list with multiple people. Don’t miss anything from now.",
      "image": "assets/images/icon_food.png",
      "color": Color(0xffF7E7FF)
    },
  ];

  int clickedIndex = 5;
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
       resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        titleSpacing: 0,
        elevation: 0,
        //leadingWidth: 50,
        leading: Visibility(
          visible: true,
          child: InkWell(
            onTap: () => {Navigator.of(context).maybePop()},
            child: Container(
              margin: EdgeInsets.only(
                right: 10,
                top: 10,
                bottom: 10,
                left: 10,
              ),
              decoration: const BoxDecoration(
                  color: Color(0xffF5F5F5), shape: BoxShape.circle),
              child: Icon(Icons.keyboard_arrow_left, color: Color(0xff2E3553), size: 30,),
            ),
          ),
        ),
        centerTitle: false,
        title: Text(
          "Create room",
          style: TextStyle(
            fontWeight: FontWeight.w900,
            color: Theme.of(context).textTheme.bodyText1!.color,
            fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Room Name",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
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
            Text(
              "Select which module you want to activate for this room. You can select only one module at a time.",
              style: TextStyle(fontSize: 13),
            ),
            Expanded(
                flex: 4,
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
                                    width: 2)
                                : null,
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
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  InkWell(
                                    child: CircleAvatar(
                                      radius: 17,
                                      backgroundColor: list[index]['color'],
                                      child: Container(
                                        width: deviceSize.width * 0.03,
                                        height: deviceSize.height * 0.03,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.contain,
                                                image: AssetImage(
                                                    list[index]['image']))),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(list[index]['description'])
                            ],
                          ),
                        ),
                      );
                    })),
            Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("More cool and fun modules coming soon"),
                    GreenPostitve(
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
                        title: "Next")
                  ],
                )),
            SizedBox(
              height: deviceSize.height * 0.02,
            )
          ],
        ),
      ),
    );
  }
}
