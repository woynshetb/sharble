import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:sharble/components/widgets/buttons.dart';
import 'package:sharble/components/widgets/custom.appbar.dart';
import 'package:sharble/components/widgets/forms.dart';
import 'package:sharble/pages/home/home.page.dart';
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
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        context: context,
        builder: (BuildContext context) {
          return Container(
            width: deviceSize.width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                )),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
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
          );
        });
  }

  customDialog({required Size deviceSize, required BuildContext context}) {
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        context: context,
        builder: (BuildContext context) {
          return Container(
            width: deviceSize.width,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                )),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
        centerTitle: false,
        backgroundColor: Color(0xffFCFBFC),
        titleSpacing: 0,
        elevation: 0,
        leading: Visibility(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
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
                child: SvgPicture.asset(
                  "assets/images/assets/icon-nav-button-back.svg",
                  width: 26,
                  height: 26,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          "Home Grocery",
          style: TextStyle(
            fontWeight: FontWeight.w900,
            color: Theme.of(context).textTheme.bodyText1!.color,
            fontSize: 14,
          ),
        ),
        actions: [
          SvgPicture.asset(
            "assets/images/assets/icon_shopping_list.svg",
            width: 26,
            height: 26,
            fit: BoxFit.contain,
          ),
          SizedBox(
            width: 5,
          ),
          CustomDropDown2(
            items: items,
            // valueUrl:   "assets/images/assets/icon-bin-blue.svg",
            valueUrl: "assets/images/assets/icon-button-room-shopping-list.svg",
            bgColor: Color(0xff48BFAA),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage("assets/images/girl.png"))),
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage("assets/images/girl.png"))),
              ),
              SizedBox(
                width: 5,
              ),
              CircleAvatar(
                radius: 10,
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
                radius: 10,
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
                radius: 10,
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
                      height: 31,
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 10, right: 20, left: 20),
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
                      height: 31,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Tasco",
                          style: TextStyle(
                            fontSize: 12,
                            color: tabController!.index == 1
                                ? Colors.white
                                : Theme.of(context).textTheme.bodyText1!.color,
                          ),
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
                      height: 31,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Edeka",
                          style: TextStyle(
                            fontSize: 12,
                            color: tabController!.index == 2
                                ? Colors.white
                                : Theme.of(context).textTheme.bodyText1!.color,
                          ),
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
                      height: 31,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Shopping Mall Center",
                          style: TextStyle(
                            fontSize: 12,
                            color: tabController!.index == 3
                                ? Colors.white
                                : Theme.of(context).textTheme.bodyText1!.color,
                          ),
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
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
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
      "desc": "Endeka",
    },
    {
      "title": "Coca Cola",
      "sub": "",
      "desc": "Endeka",
    },
    {
      "title": "Rice and Milk",
      "sub": "",
      "desc": "Shopping mall center",
    },
    {
      "title": "Bottle watter",
      "sub": "",
      "desc": "",
    },
  ];

  List<Map> copmpletedList = [
    {
      "title": "Spagetti watter",
      "sub": "1pics",
      "desc": "Tasco",
    },
    {
      "title": "Bottle watter",
      "sub": "",
      "desc": "Tasco",
    },
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
            flex: 0,
            child: ListView.builder(
                itemCount: list.length,
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
                        icon: SvgPicture.asset(
                          "assets/images/assets/icon-completed-blue.svg",
                          width: 20,
                          height: 20,
                          fit: BoxFit.contain,
                          color: Colors.white,
                        ),

                        onTap: (CompletionHandler handler) async {
                          //  list.removeAt(index);
                          //  setState(() {});
                        },
                        color: Theme.of(context).primaryColor,
                      ),
                    ],
                    trailingActions: <SwipeAction>[
                      SwipeAction(
                          icon: SvgPicture.asset(
                            "assets/images/assets/icon-bin-blue.svg",
                            width: 20,
                            height: 20,
                            color: Colors.white,
                            fit: BoxFit.contain,
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
                      margin: EdgeInsets.only(
                        bottom: 10,
                      ),
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
                                list[index]['title'],
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Visibility(
                                visible: list[index]['sub'] != "",
                                child: Text(
                                  list[index]['sub'],
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
                              Text(list[index]['desc']),
                              SizedBox(
                                width: 8,
                              ),
                              CustomDropDown(
                                show: true,
                                items: items,
                                valueUrl:
                                    "assets/images/assets/icon-button-shopping-list.svg",
                                bgColor: Color(0xffE7FFE8),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                })),
        SizedBox(
          height: 10,
        ),
        Text(
          "COMPLETED",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
            child: ListView.builder(
                itemCount: copmpletedList.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return SwipeActionCell(
                    /// this key is necessary
                    key: ObjectKey("Text"),
                    leadingActions: <SwipeAction>[
                      SwipeAction(
                        /// this is the same as iOS native
                        performsFirstActionWithFullSwipe: true,
                        icon: SvgPicture.asset(
                          "assets/images/assets/icon-completed-blue.svg",
                          width: 20,
                          height: 20,
                          fit: BoxFit.contain,
                          color: Colors.white,
                        ),

                        onTap: (CompletionHandler handler) async {
                          //  list.removeAt(index);
                          //  setState(() {});
                        },
                        color: Theme.of(context).primaryColor,
                      ),
                    ],
                    trailingActions: <SwipeAction>[
                      SwipeAction(
                          icon: SvgPicture.asset(
                            "assets/images/assets/icon-bin-blue.svg",
                            width: 20,
                            height: 20,
                            color: Colors.white,
                            fit: BoxFit.contain,
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
                      margin: EdgeInsets.only(bottom: 10),
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
                                copmpletedList[index]['title'],
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w900,
                                    color: Color(0xff8c95a4)),
                              ),
                              Visibility(
                                visible: copmpletedList[index]['sub'] != "",
                                child: Text(
                                  copmpletedList[index]['sub'],
                                  style: TextStyle(
                                      fontSize: 12, color: Color(0xff8c95a4)),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                copmpletedList[index]['desc'],
                                style: TextStyle(
                                  fontSize: 12,
                                 
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              CustomDropDown(
                                show: true,
                                items: items,
                                valueUrl:
                                    "assets/images/assets/icon-button-shopping-list.svg",
                                bgColor: Color(0xffE7FFE8),
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

class CustomDropDown2 extends StatelessWidget {
  String? valueUrl;
  Color? bgColor;
  bool? show;
  CustomDropDown2(
      {Key? key,
      required this.items,
      required this.valueUrl,
      required this.bgColor,
      this.show = false})
      : super(key: key);

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    customDialogDelete(
        {required String title,
        required String description,
        required Size deviceSize,
        required BuildContext context}) {
      return showModalBottomSheet(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          context: context,
          builder: (BuildContext context) {
            return Container(
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
            );
          });
    }

    Size deviceSize = MediaQuery.of(context).size;
    return PopupMenuButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: bgColor,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            valueUrl.toString(),
            width: 26,
            height: 26,
            fit: BoxFit.contain,
          ),
        ],
      ),
      itemBuilder: (context) {
        return List.generate(
          items.length,
          (index) => PopupMenuItem(
            onTap: () {
              // Navigator.push(
              //   context,
              //   PageRouteBuilder(
              //     pageBuilder: (context, animation1, animation2) =>
              //         const RoomSettingPage(),
              //     transitionDuration: Duration.zero,
              //     reverseTransitionDuration: Duration.zero,
              //   ),
              // );
              // if (items[index] == 'Room Settings') {
              //   Navigator.push(
              //     context,
              //     PageRouteBuilder(
              //       pageBuilder: (context, animation1, animation2) =>
              //           const RoomSettingPage(),
              //       transitionDuration: Duration.zero,
              //       reverseTransitionDuration: Duration.zero,
              //     ),
              //   );
              // } else {
              //   customDialogDelete(
              //       title: "Delete Room",
              //       description:
              //           "Are you sure you want to delete this room? It can’t be undone.",
              //       deviceSize: deviceSize,
              //       context: context);
              // }
            },
            child: InkWell(
              onTap: () {
                if (items[index] == 'Room Settings') {
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
                  items[index] == "Room Settings"
                      ? const Icon(
                          Icons.settings,
                          color: Colors.white,
                          size: 15,
                        )
                      : SvgPicture.asset(
                          "assets/images/assets/icon-bin-blue.svg",
                          width: 15,
                          height: 15,
                          color: Colors.white,
                          fit: BoxFit.contain,
                        ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    items[index],
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
