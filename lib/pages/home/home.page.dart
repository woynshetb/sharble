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
          ? Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
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
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                      ),
                      trailing: Container(
                        alignment: Alignment.topRight,
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Color(0xffE7FFE8),
                                child: Container(
                                  width: deviceSize.width * 0.035,
                                  height: deviceSize.height * 0.035,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.contain,
                                          image: AssetImage(
                                              "assets/images/icon_bag.png"))),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Color(0xffF5F5F5),
                                child: Icon(_customTileExpanded
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down),
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
                                children: const [
                                  Text(
                                    "Beans",
                                    style: TextStyle(
                                      fontSize: 13,
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text("Tasco"),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Center(
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton2(
                                        customButton: InkWell(
                                          child: CircleAvatar(
                                            radius: 18,
                                            backgroundColor: Color(0xffE7FFE8),
                                            child: Icon(Icons.more_horiz),
                                          ),
                                        ),
                                        customItemsHeights: [48, 48, 48],
                                        items: items.map((String items) {
                                          return DropdownMenuItem(
                                            value: items,
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                                // Navigator.push(
                                                //   context,
                                                //   PageRouteBuilder(
                                                //     pageBuilder: (context,
                                                //             animation1,
                                                //             animation2) =>
                                                //         const RoomSettingPage(),
                                                //     transitionDuration:
                                                //         Duration.zero,
                                                //     reverseTransitionDuration:
                                                //         Duration.zero,
                                                //   ),
                                                // );
                                              },
                                              child: Row(
                                                children: [
                                                  items == "Add to List"
                                                      ? Icon(Icons.done)
                                                      : items == "Edit"
                                                          ? Icon(Icons.edit)
                                                          : Icon(
                                                              Icons
                                                                  .delete_outline,
                                                            ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    items,
                                                    style: const TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (value) {},
                                        itemHeight: 48,
                                        itemPadding: const EdgeInsets.only(
                                            left: 16, right: 16),
                                        dropdownWidth: 160,
                                        dropdownPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 6),
                                        dropdownDecoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Color(0xffE7FFE8),
                                        ),
                                        dropdownElevation: 8,
                                        offset: const Offset(0, 8),
                                      ),
                                    ),
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
                                children: const [
                                  Text(
                                    "Beans",
                                    style: TextStyle(
                                      fontSize: 13,
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text("Tasco"),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Center(
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton2(
                                        customButton: InkWell(
                                          child: CircleAvatar(
                                            radius: 18,
                                            backgroundColor: Color(0xffE7FFE8),
                                            child: Icon(Icons.more_horiz),
                                          ),
                                        ),
                                        customItemsHeights: [48, 48, 48],
                                        items: items.map((String items) {
                                          return DropdownMenuItem(
                                            value: items,
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                                // Navigator.push(
                                                //   context,
                                                //   PageRouteBuilder(
                                                //     pageBuilder: (context,
                                                //             animation1,
                                                //             animation2) =>
                                                //         const RoomSettingPage(),
                                                //     transitionDuration:
                                                //         Duration.zero,
                                                //     reverseTransitionDuration:
                                                //         Duration.zero,
                                                //   ),
                                                // );
                                              },
                                              child: Row(
                                                children: [
                                                  items == "Add to List"
                                                      ? Icon(Icons.done)
                                                      : items == "Edit"
                                                          ? Icon(Icons.edit)
                                                          : Icon(
                                                              Icons
                                                                  .delete_outline,
                                                            ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    items,
                                                    style: const TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (value) {},
                                        itemHeight: 48,
                                        itemPadding: const EdgeInsets.only(
                                            left: 16, right: 16),
                                        dropdownWidth: 160,
                                        dropdownPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 6),
                                        dropdownDecoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Color(0xffE7FFE8),
                                        ),
                                        dropdownElevation: 8,
                                        offset: const Offset(0, 8),
                                      ),
                                    ),
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
                                children: const [
                                  Text(
                                    "Beans",
                                    style: TextStyle(
                                      fontSize: 13,
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text("Tasco"),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Center(
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton2(
                                        customButton: InkWell(
                                          child: CircleAvatar(
                                            radius: 18,
                                            backgroundColor: Color(0xffE7FFE8),
                                            child: Icon(Icons.more_horiz),
                                          ),
                                        ),
                                        customItemsHeights: [48, 48, 48],
                                        items: items.map((String items) {
                                          return DropdownMenuItem(
                                            value: items,
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                                // Navigator.push(
                                                //   context,
                                                //   PageRouteBuilder(
                                                //     pageBuilder: (context,
                                                //             animation1,
                                                //             animation2) =>
                                                //         const RoomSettingPage(),
                                                //     transitionDuration:
                                                //         Duration.zero,
                                                //     reverseTransitionDuration:
                                                //         Duration.zero,
                                                //   ),
                                                // );
                                              },
                                              child: Row(
                                                children: [
                                                  items == "Add to List"
                                                      ? Icon(Icons.done)
                                                      : items == "Edit"
                                                          ? Icon(Icons.edit)
                                                          : Icon(
                                                              Icons
                                                                  .delete_outline,
                                                            ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    items,
                                                    style: const TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (value) {},
                                        itemHeight: 48,
                                        itemPadding: const EdgeInsets.only(
                                            left: 16, right: 16),
                                        dropdownWidth: 160,
                                        dropdownPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 6),
                                        dropdownDecoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Color(0xffE7FFE8),
                                        ),
                                        dropdownElevation: 8,
                                        offset: const Offset(0, 8),
                                      ),
                                    ),
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
                                children: const [
                                  Text(
                                    "Beans",
                                    style: TextStyle(
                                      fontSize: 13,
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text("Tasco"),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Center(
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton2(
                                        customButton: InkWell(
                                          child: CircleAvatar(
                                            radius: 18,
                                            backgroundColor: Color(0xffE7FFE8),
                                            child: Icon(Icons.more_horiz),
                                          ),
                                        ),
                                        customItemsHeights: [48, 48, 48],
                                        items: items.map((String items) {
                                          return DropdownMenuItem(
                                            value: items,
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                                // Navigator.push(
                                                //   context,
                                                //   PageRouteBuilder(
                                                //     pageBuilder: (context,
                                                //             animation1,
                                                //             animation2) =>
                                                //         const RoomSettingPage(),
                                                //     transitionDuration:
                                                //         Duration.zero,
                                                //     reverseTransitionDuration:
                                                //         Duration.zero,
                                                //   ),
                                                // );
                                              },
                                              child: Row(
                                                children: [
                                                  items == "Add to List"
                                                      ? Icon(Icons.done)
                                                      : items == "Edit"
                                                          ? Icon(Icons.edit)
                                                          : Icon(
                                                              Icons
                                                                  .delete_outline,
                                                            ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    items,
                                                    style: const TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (value) {},
                                        itemHeight: 48,
                                        itemPadding: const EdgeInsets.only(
                                            left: 16, right: 16),
                                        dropdownWidth: 160,
                                        dropdownPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 6),
                                        dropdownDecoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Color(0xffE7FFE8),
                                        ),
                                        dropdownElevation: 8,
                                        offset: const Offset(0, 8),
                                      ),
                                    ),
                                  ),
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
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                      ),
                      trailing: Container(
                        alignment: Alignment.topRight,
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Color(0xffE7FEFF),
                                child: Container(
                                  width: deviceSize.width * 0.035,
                                  height: deviceSize.height * 0.035,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.contain,
                                          image: AssetImage(
                                              "assets/images/icon_add.png"))),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Color(0xffF5F5F5),
                                child: Icon(_customTileExpanded
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down),
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
                                children: [
                                  Text(
                                    "Need to Clean the room",
                                    style: TextStyle(
                                      fontSize: 13,
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
                                  Center(
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton2(
                                        customButton: InkWell(
                                          child: CircleAvatar(
                                            radius: 18,
                                            backgroundColor: Color(0xffE7FFE8),
                                            child: Icon(Icons.more_horiz),
                                          ),
                                        ),
                                        customItemsHeights: [48, 48, 48],
                                        items: items.map((String items) {
                                          return DropdownMenuItem(
                                            value: items,
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                                // Navigator.push(
                                                //   context,
                                                //   PageRouteBuilder(
                                                //     pageBuilder: (context,
                                                //             animation1,
                                                //             animation2) =>
                                                //         const RoomSettingPage(),
                                                //     transitionDuration:
                                                //         Duration.zero,
                                                //     reverseTransitionDuration:
                                                //         Duration.zero,
                                                //   ),
                                                // );
                                              },
                                              child: Row(
                                                children: [
                                                  items == "Add to List"
                                                      ? Icon(Icons.done)
                                                      : items == "Edit"
                                                          ? Icon(Icons.edit)
                                                          : Icon(
                                                              Icons
                                                                  .delete_outline,
                                                            ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    items,
                                                    style: const TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (value) {},
                                        itemHeight: 48,
                                        itemPadding: const EdgeInsets.only(
                                            left: 16, right: 16),
                                        dropdownWidth: 160,
                                        dropdownPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 6),
                                        dropdownDecoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Color(0xffE7FFE8),
                                        ),
                                        dropdownElevation: 8,
                                        offset: const Offset(0, 8),
                                      ),
                                    ),
                                  ),
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
                                      fontSize: 13,
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
                                  Center(
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton2(
                                        customButton: InkWell(
                                          child: CircleAvatar(
                                            radius: 18,
                                            backgroundColor: Color(0xffE7FFE8),
                                            child: Icon(Icons.more_horiz),
                                          ),
                                        ),
                                        customItemsHeights: [48, 48, 48],
                                        items: items.map((String items) {
                                          return DropdownMenuItem(
                                            value: items,
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                                // Navigator.push(
                                                //   context,
                                                //   PageRouteBuilder(
                                                //     pageBuilder: (context,
                                                //             animation1,
                                                //             animation2) =>
                                                //         const RoomSettingPage(),
                                                //     transitionDuration:
                                                //         Duration.zero,
                                                //     reverseTransitionDuration:
                                                //         Duration.zero,
                                                //   ),
                                                // );
                                              },
                                              child: Row(
                                                children: [
                                                  items == "Add to List"
                                                      ? Icon(Icons.done)
                                                      : items == "Edit"
                                                          ? Icon(Icons.edit)
                                                          : Icon(
                                                              Icons
                                                                  .delete_outline,
                                                            ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    items,
                                                    style: const TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (value) {},
                                        itemHeight: 48,
                                        itemPadding: const EdgeInsets.only(
                                            left: 16, right: 16),
                                        dropdownWidth: 160,
                                        dropdownPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 6),
                                        dropdownDecoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Color(0xffE7FFE8),
                                        ),
                                        dropdownElevation: 8,
                                        offset: const Offset(0, 8),
                                      ),
                                    ),
                                  ),
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
                                      fontSize: 13,
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
                                  Center(
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton2(
                                        customButton: InkWell(
                                          child: CircleAvatar(
                                            radius: 18,
                                            backgroundColor: Color(0xffE7FFE8),
                                            child: Icon(Icons.more_horiz),
                                          ),
                                        ),
                                        customItemsHeights: [48, 48, 48],
                                        items: items.map((String items) {
                                          return DropdownMenuItem(
                                            value: items,
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                                // Navigator.push(
                                                //   context,
                                                //   PageRouteBuilder(
                                                //     pageBuilder: (context,
                                                //             animation1,
                                                //             animation2) =>
                                                //         const RoomSettingPage(),
                                                //     transitionDuration:
                                                //         Duration.zero,
                                                //     reverseTransitionDuration:
                                                //         Duration.zero,
                                                //   ),
                                                // );
                                              },
                                              child: Row(
                                                children: [
                                                  items == "Add to List"
                                                      ? Icon(Icons.done)
                                                      : items == "Edit"
                                                          ? Icon(Icons.edit)
                                                          : Icon(
                                                              Icons
                                                                  .delete_outline,
                                                            ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    items,
                                                    style: const TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (value) {},
                                        itemHeight: 48,
                                        itemPadding: const EdgeInsets.only(
                                            left: 16, right: 16),
                                        dropdownWidth: 160,
                                        dropdownPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 6),
                                        dropdownDecoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Color(0xffE7FFE8),
                                        ),
                                        dropdownElevation: 8,
                                        offset: const Offset(0, 8),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
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
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                      ),
                      onExpansionChanged: (bool expanded) {
                        setState(() => _customTileExpanded = expanded);
                      },
                      trailing: Container(
                        alignment: Alignment.topRight,
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Color(0xffFFE7E7),
                                child: Container(
                                  width: deviceSize.width * 0.04,
                                  height: deviceSize.height * 0.04,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.contain,
                                          image: AssetImage(
                                              "assets/images/icon_wallet.png"))),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Color(0xffF5F5F5),
                                child: Icon(_customTileExpanded
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down),
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
                                      fontSize: deviceSize.width * 0.028,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  RichText(
                                    overflow: TextOverflow.clip,
                                    textAlign: TextAlign.end,
                                    textDirection: TextDirection.rtl,
                                    softWrap: true,
                                    textScaleFactor: 1,
                                    text: TextSpan(
                                      text: 'Dept accepted \n by ',
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
                                      fontSize: deviceSize.width * 0.028,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  RichText(
                                    overflow: TextOverflow.clip,
                                    textAlign: TextAlign.end,
                                    textDirection: TextDirection.rtl,
                                    softWrap: true,
                                    textScaleFactor: 1,
                                    text: TextSpan(
                                      text: 'Dept accepted \n by ',
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
                                      fontSize: deviceSize.width * 0.028,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  RichText(
                                    overflow: TextOverflow.clip,
                                    textAlign: TextAlign.end,
                                    textDirection: TextDirection.rtl,
                                    softWrap: true,
                                    textScaleFactor: 1,
                                    text: TextSpan(
                                      text: 'Dept accepted \n by ',
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
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                      ),
                      trailing: Container(
                        alignment: Alignment.topRight,
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Color(0xffFFE7E7),
                                child: Container(
                                  width: deviceSize.width * 0.04,
                                  height: deviceSize.height * 0.04,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.contain,
                                          image: AssetImage(
                                              "assets/images/icon_wallet.png"))),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Color(0xffF5F5F5),
                                child: Icon(_customTileExpanded
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down),
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
                                      InkWell(
                                        child: CircleAvatar(
                                          radius: 18,
                                          backgroundColor: Color(0xffF7E7FF),
                                          child: Icon(Icons.more_horiz),
                                        ),
                                      ),
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
                                      InkWell(
                                        child: CircleAvatar(
                                          radius: 18,
                                          backgroundColor: Color(0xffF7E7FF),
                                          child: Icon(Icons.more_horiz),
                                        ),
                                      ),
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
                                      InkWell(
                                        child: CircleAvatar(
                                          radius: 18,
                                          backgroundColor: Color(0xffF7E7FF),
                                          child: Icon(Icons.more_horiz),
                                        ),
                                      ),
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
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                      ),
                      trailing: Container(
                        alignment: Alignment.topRight,
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Color(0xffE7FFE8),
                                child: Container(
                                  width: deviceSize.width * 0.035,
                                  height: deviceSize.height * 0.035,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.contain,
                                          image: AssetImage(
                                              "assets/images/icon_bag.png"))),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Color(0xffF5F5F5),
                                child: Icon(Icons.keyboard_arrow_up),
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
                                      InkWell(
                                        child: CircleAvatar(
                                          radius: 18,
                                          backgroundColor: Color(0xffF7E7FF),
                                          child: Icon(Icons.more_horiz),
                                        ),
                                      ),
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
                                      InkWell(
                                        child: CircleAvatar(
                                          radius: 18,
                                          backgroundColor: Color(0xffF7E7FF),
                                          child: Icon(Icons.more_horiz),
                                        ),
                                      ),
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
                                      InkWell(
                                        child: CircleAvatar(
                                          radius: 18,
                                          backgroundColor: Color(0xffF7E7FF),
                                          child: Icon(Icons.more_horiz),
                                        ),
                                      ),
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
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                      ),
                      trailing: Container(
                        alignment: Alignment.topRight,
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Color(0xffFFE7E7),
                                child: Container(
                                  width: deviceSize.width * 0.04,
                                  height: deviceSize.height * 0.04,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.contain,
                                          image: AssetImage(
                                              "assets/images/icon_wallet.png"))),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Color(0xffF5F5F5),
                                child: Icon(Icons.keyboard_arrow_up),
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
