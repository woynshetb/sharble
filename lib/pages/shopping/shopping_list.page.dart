import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:sharble/components/widgets/buttons.dart';
import 'package:sharble/components/widgets/forms.dart';
import 'package:sharble/pages/room/room_setting.page.dart';
import 'package:sharble/services/validator.service.dart';

class ShoppingListPage extends StatefulWidget {
  const ShoppingListPage({Key? key}) : super(key: key);

  @override
  State<ShoppingListPage> createState() => _ShoppingListPageState();
}

class _ShoppingListPageState extends State<ShoppingListPage>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  String dropdownvalue = 'Room Settings';

  // List of items in our dropdown menu
  var items = [
    'Room Settings',
    'Delete Room',
  ];

  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(vsync: this, length: 4, initialIndex: 0);
    super.initState();
  }

  customDialogDelete(
      {required String title,
      required String description,
      required Size deviceSize,
      required BuildContext context}) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            child: Container(
              width: deviceSize.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  )),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      description,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GreenNegative(
                            val: deviceSize.width * 0.09,
                            onPressed: () {
                              var nav = Navigator.of(context);
                              nav.pop();
                            },
                            title: "No"),
                        GreenPostitve(
                            onPressed: () {
                              var nav = Navigator.of(context);
                              nav.pop();
                            },
                            title: "Yes")
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  customDialog({required Size deviceSize, required BuildContext context}) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            child: Container(
              width: deviceSize.width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  )),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Item Name",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    DefaultField(
                      keyboardType: TextInputType.emailAddress,
                      textEditingController: TextEditingController(),
                      obscureText: false,
                      onTap: () {},
                      validator: (value) => FormValidator.validateEmail(value!),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Quantity",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    DefaultField(
                      keyboardType: TextInputType.emailAddress,
                      textEditingController: TextEditingController(),
                      hintText: "wbilihatu@gmail.com",
                      obscureText: false,
                      onTap: () {},
                      validator: (value) => FormValidator.validateEmail(value!),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Store",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    DefaultField(
                      keyboardType: TextInputType.emailAddress,
                      textEditingController: TextEditingController(),
                      hintText: "wbilihatu@gmail.com",
                      obscureText: false,
                      onTap: () {},
                      validator: (value) => FormValidator.validateEmail(value!),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GreenPostitve(
                        onPressed: () {
                          var nav = Navigator.of(context);
                          nav.pop();
                        },
                        title: "Add")
                  ],
                ),
              ),
            ),
          );
        });
  }

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
              margin: const EdgeInsets.only(
                right: 10,
                top: 10,
                bottom: 10,
                left: 10,
              ),
              decoration: const BoxDecoration(
                  color: Color(0xffF5F5F5), shape: BoxShape.circle),
              child: Icon(
                Icons.keyboard_arrow_left,
                color: Color(0xff2E3553),
                size: 30,
              ),
            ),
          ),
        ),
        centerTitle: false,
        title: Text(
          "Home Grocery",
          style: TextStyle(
            fontWeight: FontWeight.w900,
            color: Theme.of(context).textTheme.bodyText1!.color,
            fontSize: 18,
          ),
        ),
        actions: [
          Container(
            width: 35,
            height: 35,
            padding: EdgeInsets.all(8),
            decoration: const BoxDecoration(
                color: Color(
                  0xffE7FFE8,
                ),
                shape: BoxShape.circle),
            child: Image.asset(
              "assets/images/icon_bag.png",
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Center(
            child: DropdownButtonHideUnderline(
              child: DropdownButton2(
                customButton: Container(
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(
                    color: Color(0xff48BFAA),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.more_horiz_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                customItemsHeights: [48, 48],
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: InkWell(
                      onTap: () {
                        if (items == 'Room Settings') {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation1, animation2) =>
                                  const RoomSettingPage(),
                              transitionDuration: Duration.zero,
                              reverseTransitionDuration: Duration.zero,
                            ),
                          );
                        } else {
                          customDialogDelete(
                              title: "Delete Room",
                              description:
                                  "Are you sure you want to delete this room? It can’t be undone.",
                              deviceSize: deviceSize,
                              context: context);
                        }
                      },
                      child: Row(
                        children: [
                          items == 'Room Settings'
                              ? Icon(
                                  Icons.settings,
                                )
                              : Icon(
                                  Icons.delete_outline,
                                ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            items,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (value) {},
                itemHeight: 48,
                itemPadding: const EdgeInsets.only(left: 16, right: 16),
                dropdownWidth: 160,
                dropdownPadding: const EdgeInsets.symmetric(
                  vertical: 6,
                ),
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).primaryColor,
                ),
                dropdownElevation: 8,
                offset: const Offset(0, 8),
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Column(children: [
          Row(
            children: [
              Container(
                width: deviceSize.width * 0.06,
                height: deviceSize.height * 0.06,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage("assets/images/girl.png"))),
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                width: deviceSize.width * 0.06,
                height: deviceSize.height * 0.06,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage("assets/images/girl.png"))),
              ),
              SizedBox(
                width: 5,
              ),
              CircleAvatar(
                radius: 12,
                backgroundColor: Theme.of(context).primaryColor,
                child: Text(
                  "TM",
                  style: TextStyle(color: Colors.white, fontSize: 8),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              CircleAvatar(
                radius: 12,
                backgroundColor: Theme.of(context).primaryColor,
                child: Text(
                  "TM",
                  style: TextStyle(color: Colors.white, fontSize: 8),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              CircleAvatar(
                radius: 12,
                backgroundColor: Theme.of(context).primaryColor,
                child: Text(
                  "TM",
                  style: TextStyle(color: Colors.white, fontSize: 8),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              //     StatusView(
              //   radius: 20,
              //   spacing: 15,
              //   strokeWidth: 2,
              //   indexOfSeenStatus: 2,
              //   numberOfStatus: 20,
              //   padding: 4,
              //   centerImageUrl: "https://picsum.photos/200/300",
              //   seenColor: Colors.grey,
              //   unSeenColor: Colors.red,
              // ),
            ],
          ),
          DefaultTabController(
              length: 4,
              child: TabBar(
                onTap: (index) {
                  setState(() {
                    tabController!.index = index;
                  });
                },
                controller: tabController,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                isScrollable: true,
                labelPadding: EdgeInsets.only(right: 10),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),

                  // Creates border
                  color: Colors.transparent,
                ),
                tabs: [
                  Tab(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      child: Text(
                        "All",
                        style: TextStyle(
                          fontSize: 12,
                          color: tabController!.index == 0
                              ? Colors.white
                              : Theme.of(context).textTheme.bodyText1!.color,
                        ),
                      ),
                      decoration: BoxDecoration(
                        border: tabController!.index == 0
                            ? null
                            : Border.all(
                                color: Theme.of(context).primaryColor,
                              ),
                        borderRadius: BorderRadius.circular(10),
                        color: tabController!.index == 0
                            ? Theme.of(context).primaryColor
                            : Colors.white,
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      child: Text(
                        "Tasco",
                        style: TextStyle(
                          fontSize: 12,
                          color: tabController!.index == 1
                              ? Colors.white
                              : Theme.of(context).textTheme.bodyText1!.color,
                        ),
                      ),
                      decoration: BoxDecoration(
                        border: tabController!.index == 1
                            ? null
                            : Border.all(color: Theme.of(context).primaryColor),
                        borderRadius: BorderRadius.circular(10),
                        color: tabController!.index == 1
                            ? Theme.of(context).primaryColor
                            : Colors.white,
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      child: Text(
                        "Edeka",
                        style: TextStyle(
                          fontSize: 12,
                          color: tabController!.index == 2
                              ? Colors.white
                              : Theme.of(context).textTheme.bodyText1!.color,
                        ),
                      ),
                      decoration: BoxDecoration(
                        border: tabController!.index == 2
                            ? null
                            : Border.all(color: Theme.of(context).primaryColor),
                        borderRadius: BorderRadius.circular(10),
                        color: tabController!.index == 2
                            ? Theme.of(context).primaryColor
                            : Colors.white,
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      child: Text(
                        "Shopping Mall Center",
                        style: TextStyle(
                          fontSize: 12,
                          color: tabController!.index == 3
                              ? Colors.white
                              : Theme.of(context).textTheme.bodyText1!.color,
                        ),
                      ),
                      decoration: BoxDecoration(
                        border: tabController!.index == 3
                            ? null
                            : Border.all(color: Theme.of(context).primaryColor),
                        borderRadius: BorderRadius.circular(10),
                        color: tabController!.index == 3
                            ? Theme.of(context).primaryColor
                            : Colors.white,
                      ),
                    ),
                  ),
                ],
              )),
          Expanded(
            child: TabBarView(
              controller: tabController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                CustomTabBody(),
                CustomTabBody(),
                CustomTabBody(),
                CustomTabBody(),
              ],
            ),
          )
        ]),
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
            customDialog(
              context: context,
              deviceSize: deviceSize,
            );
          },
        ),
      ),
    );
  }
}

class CustomTabBody extends StatefulWidget {
  CustomTabBody({Key? key}) : super(key: key);

  @override
  State<CustomTabBody> createState() => _CustomTabBodyState();
}

class _CustomTabBodyState extends State<CustomTabBody> {
  customDialog(
      {required String title,
      required String description,
      required Size deviceSize,
      required BuildContext context}) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            child: Container(
              width: deviceSize.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  )),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      description,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GreenNegative(
                            val: deviceSize.width * 0.09,
                            onPressed: () {
                              var nav = Navigator.of(context);
                              nav.pop();
                            },
                            title: "No"),
                        GreenPostitve(
                            onPressed: () {
                              var nav = Navigator.of(context);
                              nav.pop();
                            },
                            title: "Yes")
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  List<Map> list = [
    {
      "title": "Beans",
      "sub": "1 pcs",
      "desc": "Tasco",
    },
    {
      "title": "Coca Cola",
      "sub": "",
      "desc": "Tasco",
    }
  ];

  String dropdownvalue = 'Completed';

  // List of items in our dropdown menu
  var items = ['Completed', 'Edit', 'Remove'];

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        Text(
          "OPEN",
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 10),
        ),
        SizedBox(
          height: 5,
        ),
        Expanded(
            child: ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
               physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return SwipeActionCell(
                    /// this key is necessary
                    key: ObjectKey("Text"),
                    leadingActions: <SwipeAction>[
                      SwipeAction(
                        /// this is the same as iOS native
                        performsFirstActionWithFullSwipe: true,
                        icon: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                )),
                            child: Icon(
                              Icons.done,
                              color: Colors.white,
                              size: 13,
                            )),

                        onTap: (CompletionHandler handler) async {
                          //  list.removeAt(index);
                          //  setState(() {});
                        },
                        color: Theme.of(context).primaryColor,
                      ),
                    ],
                    trailingActions: <SwipeAction>[
                      SwipeAction(
                          icon: Icon(
                            Icons.delete_outline_outlined,
                            color: Colors.white,
                          ),

                          /// this is the same as iOS native
                          performsFirstActionWithFullSwipe: false,
                          onTap: (CompletionHandler handler) async {
                            customDialog(
                                title: "Delete Room",
                                description:
                                    "Are you sure you want to delete this room? It can’t be undone.",
                                deviceSize: deviceSize,
                                context: context);
                          },
                          color: Colors.red),
                    ],
                    child: Container(
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
                            children: [
                              Text(
                                "Beans",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Visibility(
                                visible: index == 0,
                                child: Text(
                                  "1pics",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
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
                                              items == "Completed"
                                                  ? Icon(Icons.done)
                                                  : items == "Edit"
                                                      ? Icon(Icons.edit)
                                                      : Icon(
                                                          Icons.delete_outline,
                                                        ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                items,
                                                style: const TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w600,
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
                                        const EdgeInsets.symmetric(vertical: 6),
                                    dropdownDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(0xffE7FFE8),
                                    ),
                                    dropdownElevation: 8,
                                    offset: const Offset(0, 8),
                                  ),
                                ),
                              ),
                              // DropdownButtonHideUnderline(
                              //   child: Theme(
                              //     data: Theme.of(context).copyWith(
                              //       canvasColor: Color(0xffE7FFE8),
                              //     ),
                              //     child: DropdownButton(
                              //       iconSize: 0,
                              //       isDense: true,
                              //       isExpanded: false,
                              //       borderRadius: BorderRadius.circular(10),
                              //       icon: Container(
                              //         width: 30,
                              //         height: 30,
                              //         decoration: const BoxDecoration(
                              //           color: Color(0xff48BFAA),
                              //           shape: BoxShape.circle,
                              //         ),
                              //         child: const Icon(
                              //           Icons.more_horiz_outlined,
                              //           color: Colors.white,
                              //           size: 30,
                              //         ),
                              //       ),

                              //       // Array list of items
                              //       items: items.map((String items) {
                              //         return DropdownMenuItem(
                              //           value: items,
                              //           child: InkWell(
                              //             onTap: () {
                              //               Navigator.push(
                              //                 context,
                              //                 PageRouteBuilder(
                              //                   pageBuilder: (context,
                              //                           animation1,
                              //                           animation2) =>
                              //                       const RoomSettingPage(),
                              //                   transitionDuration:
                              //                       Duration.zero,
                              //                   reverseTransitionDuration:
                              //                       Duration.zero,
                              //                 ),
                              //               );
                              //             },
                              //             child: Row(
                              //               children: [
                              //                 items == "Completed"
                              //                     ? Icon(Icons.done)
                              //                     : items == "Edit"
                              //                         ? Icon(Icons.edit)
                              //                         : Icon(
                              //                             Icons.delete_outline,
                              //                           ),
                              //                 const SizedBox(
                              //                   width: 10,
                              //                 ),
                              //                 Text(
                              //                   items,
                              //                   style: const TextStyle(
                              //                     fontSize: 13,
                              //                     fontWeight: FontWeight.w600,
                              //                   ),
                              //                 )
                              //               ],
                              //             ),
                              //           ),
                              //         );
                              //       }).toList(),
                              //       // After selecting the desired option,it will
                              //       // change button value to selected value
                              //       onChanged: (String? newValue) {
                              //         setState(() {
                              //           dropdownvalue = newValue!;
                              //         });
                              //       },
                              //     ),
                              //   ),
                              // ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                })),
        SizedBox(
          height: 20,
        ),
        Text(
          "Completed",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
            child: ListView.builder(
                itemCount: 2,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return SwipeActionCell(
                    /// this key is necessary
                    key: ObjectKey("Text"),
                    leadingActions: <SwipeAction>[
                      SwipeAction(
                        /// this is the same as iOS native
                        performsFirstActionWithFullSwipe: true,
                        icon: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                )),
                            child: Icon(
                              Icons.done,
                              color: Colors.white,
                              size: 13,
                            )),

                        onTap: (CompletionHandler handler) async {
                          //  list.removeAt(index);
                          //  setState(() {});
                        },
                        color: Theme.of(context).primaryColor,
                      ),
                    ],
                    trailingActions: <SwipeAction>[
                      SwipeAction(
                          icon: Icon(
                            Icons.delete_outline_outlined,
                            color: Colors.white,
                          ),

                          /// this is the same as iOS native
                          performsFirstActionWithFullSwipe: false,
                          onTap: (CompletionHandler handler) async {
                            //  list.removeAt(index);
                            //  setState(() {});
                          },
                          color: Colors.red),
                    ],
                    child: Container(
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
                            children: [
                              Text(
                                "Beans",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Visibility(
                                child: Text(
                                  "1pics",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
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
                                              items == "Completed"
                                                  ? Icon(Icons.done)
                                                  : items == "Edit"
                                                      ? Icon(Icons.edit)
                                                      : Icon(
                                                          Icons.delete_outline,
                                                        ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                items,
                                                style: const TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w600,
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
                                        const EdgeInsets.symmetric(vertical: 6),
                                    dropdownDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
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
                  );
                })),
      ],
    );
  }
}
