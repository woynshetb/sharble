import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:sharble/components/widgets/buttons.dart';
import 'package:sharble/pages/home/home.page.dart';
import 'package:sharble/pages/room/room_setting.page.dart';

class DeptOrganizer extends StatefulWidget {
  const DeptOrganizer({Key? key}) : super(key: key);

  @override
  State<DeptOrganizer> createState() => _DeptOrganizerState();
}

class _DeptOrganizerState extends State<DeptOrganizer>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(vsync: this, length: 4, initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffFCFBFC),
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
          "Owing me a lot of money",
          style: TextStyle(
            fontWeight: FontWeight.w900,
            color: Theme.of(context).textTheme.bodyText1!.color,
            fontSize: 14,
          ),
        ),
        actions: [
          SvgPicture.asset(
            "assets/images/assets/icon-dept-organizer.svg",
            width: 26,
            height: 26,
            fit: BoxFit.contain,
          ),
          SizedBox(
            width: 5,
          ),
          SvgPicture.asset(
            "assets/images/assets/icon-button-room-dept-organizer.svg",
            width: 26,
            height: 26,
            fit: BoxFit.contain,
          ),
          // CustomDropDown2(
          //   items: items,
          //   // valueUrl:   "assets/images/assets/icon-bin-blue.svg",
          //   valueUrl: "assets/images/assets/icon-button-room-shopping-list.svg",
          //   bgColor: Color(0xff48BFAA),
          // ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
        child: Column(
              // mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(deviceSize.width * 0.03),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 7,
                    blurRadius: 10,
                    offset: Offset(3, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Lender",
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 13,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          fit: BoxFit.contain,
                                          image: AssetImage(
                                              "assets/images/girl.png"))),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Emanualla \nLonghornloop",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const VerticalDivider(
                          color: Colors.grey,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Borrower",
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 13,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Lina Cocony",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          fit: BoxFit.contain,
                                          image: AssetImage(
                                              "assets/images/girl.png"))),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: deviceSize.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Borrowed",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 13,
                        ),
                      ),
                      Text(
                        "\$500",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: deviceSize.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Currently Owing you",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 13,
                        ),
                      ),
                      Text(
                        "\$200",
                        style: TextStyle(
                          color: Color(0xff48BFAA),
                          fontWeight: FontWeight.w800,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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
                        width: 53,
                        // padding: const EdgeInsets.only(
                        //     top: 10, bottom: 10, right: 20, left: 20),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "All",
                            style: TextStyle(
                              fontSize: 12,
                              color: tabController!.index == 0
                                  ? Colors.white
                                  : Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .color,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          border: tabController!.index == 0
                              ? null
                              : Border.all(
                                  color: Color(0xffD65555),
                                ),
                          borderRadius: BorderRadius.circular(10),
                          color: tabController!.index == 0
                              ? Color(0xffD65555)
                              : Colors.white,
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        height: 31,
                        width: 71,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Open",
                            style: TextStyle(
                              fontSize: 12,
                              color: tabController!.index == 1
                                  ? Colors.white
                                  : Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .color,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          border: tabController!.index == 1
                              ? null
                              : Border.all(
                                  color: Color(0xffD65555),
                                ),
                          borderRadius: BorderRadius.circular(10),
                          color: tabController!.index == 1
                              ? Color(0xffD65555)
                              : Colors.white,
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        height: 31,
                        width: 103,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Completed",
                            style: TextStyle(
                              fontSize: 12,
                              color: tabController!.index == 2
                                  ? Colors.white
                                  : Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .color,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          border: tabController!.index == 2
                              ? null
                              : Border.all(
                                  color: Color(0xffD65555),
                                ),
                          borderRadius: BorderRadius.circular(10),
                          color: tabController!.index == 2
                              ? Color(0xffD65555)
                              : Colors.white,
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        height: 31,
                        width: 94,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Canceled",
                            style: TextStyle(
                              fontSize: 12,
                              color: tabController!.index == 3
                                  ? Colors.white
                                  : Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .color,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          border: tabController!.index == 3
                              ? null
                              : Border.all(
                                  color: Color(0xffD65555),
                                ),
                          borderRadius: BorderRadius.circular(10),
                          color: tabController!.index == 3
                              ? Color(0xffD65555)
                              : Colors.white,
                        ),
                      ),
                    ),
                  ],
                )),
            Expanded(
              child: TabBarView(
                controller: tabController,
                // physics: NeverScrollableScrollPhysics(),
                children: [
                  CustomTabBody(),
                  CustomTabBody(),
                  CustomTabBody(),
                  CustomTabBody(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// class CustomTabBody extends StatefulWidget {
//   CustomTabBody({Key? key}) : super(key: key);

//   @override
//   State<CustomTabBody> createState() => _CustomTabBodyState();
// }

// class _CustomTabBodyState extends State<CustomTabBody> {
//   customDialog(
//       {required String title,
//       required String description,
//       required Size deviceSize,
//       required BuildContext context}) {
//     return showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return Dialog(
//             backgroundColor: Colors.transparent,
//             child: Container(
//               width: deviceSize.width,
//               decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(15),
//                     topRight: Radius.circular(15),
//                   )),
//               child: Padding(
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text(
//                       title,
//                       style: TextStyle(
//                         fontSize: 13,
//                         fontWeight: FontWeight.w900,
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Text(
//                       description,
//                       textAlign: TextAlign.center,
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         GreenNegative(
//                             val: deviceSize.width * 0.09,
//                             onPressed: () {
//                               var nav = Navigator.of(context);
//                               nav.pop();
//                             },
//                             title: "No"),
//                         GreenPostitve(
//                             onPressed: () {
//                               var nav = Navigator.of(context);
//                               nav.pop();
//                             },
//                             title: "Yes")
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           );
//         });
//   }

//   List<Map> list = [
//     {
//       "title": "Beans",
//       "sub": "1 pcs",
//       "desc": "Tasco",
//     },
//     {
//       "title": "Coca Cola",
//       "sub": "",
//       "desc": "Endeka",
//     },
//     {
//       "title": "Coca Cola",
//       "sub": "",
//       "desc": "Endeka",
//     },
//     {
//       "title": "Rice and Milk",
//       "sub": "",
//       "desc": "Shopping mall center",
//     },
//     {
//       "title": "Bottle watter",
//       "sub": "",
//       "desc": "",
//     },
//   ];

//   List<Map> copmpletedList = [
//     {
//       "title": "Spagetti watter",
//       "sub": "1pics",
//       "desc": "Tasco",
//     },
//     {
//       "title": "Bottle watter",
//       "sub": "",
//       "desc": "Tasco",
//     },
//   ];

//   String dropdownvalue = 'Completed';

//   // List of items in our dropdown menu
//   var items = ['Completed', 'Edit', 'Remove'];

//   @override
//   Widget build(BuildContext context) {
//     Size deviceSize = MediaQuery.of(context).size;
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(
//           height: 10,
//         ),
//         Text(
//           "OPEN",
//           style: TextStyle(
//               color: Color(0xffD65555),
//               fontWeight: FontWeight.bold,
//               fontSize: 10),
//         ),
//         SizedBox(
//           height: 5,
//         ),
//         Expanded(
//           //  flex: 0,
//             child: ListView.builder(
//               physics: NeverScrollableScrollPhysics(),
//                 itemCount: 3,
//                 itemBuilder: (context, index) {
//                   return Container(
//                     padding: EdgeInsets.all(15),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(10),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.shade100,
//                           blurRadius:
//                               50, // has the effect of softening the shadow
//                           spreadRadius:
//                               1, // has the effect of extending the shadow
//                           offset: Offset(
//                             5.0, // horizontal, move right 10
//                             5.0, // vertical, move down 10
//                           ),
//                         )
//                       ],
//                     ),
//                     child: Column(
//                       // mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               "Borrowing Money for \nschool trip and launch ",
//                               style: TextStyle(
//                                 fontSize: 13,
//                                 fontFamily: "Gilroy",
//                                 fontWeight: FontWeight.w800,
//                               ),
//                             ),
//                             RichText(
//                               overflow: TextOverflow.clip,
//                               textAlign: TextAlign.end,
//                               textDirection: TextDirection.rtl,
//                               softWrap: true,
//                               textScaleFactor: 1,
//                               text: TextSpan(
//                                 text: 'Dept accepted\nby ',
//                                 style: TextStyle(
//                                   fontSize: 10,
//                                   color: Color(0xff2E3553),
//                                   fontFamily: "Gilroy",
//                                 ),
//                                 children: const <TextSpan>[
//                                   TextSpan(
//                                       text: 'Lina Cocona',
//                                       style: TextStyle(
//                                         color: Color(0xff2E3553),
//                                         fontFamily: "Gilroy",
//                                         fontWeight: FontWeight.bold,
//                                       )),
//                                 ],
//                               ),
//                             )
//                           ],
//                         ),
//                         SizedBox(
//                           height: deviceSize.height * 0.01,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             RichText(
//                               overflow: TextOverflow.clip,
//                               textAlign: TextAlign.end,
//                               textDirection: TextDirection.rtl,
//                               softWrap: true,
//                               textScaleFactor: 1,
//                               text: TextSpan(
//                                 text: 'Paid',
//                                 style: TextStyle(
//                                   color: Color(0xff2E3553),
//                                   fontSize: deviceSize.width * 0.03,
//                                   fontFamily: "Gilroy",
//                                 ),
//                                 children: const <TextSpan>[
//                                   TextSpan(
//                                       text: ' \$50',
//                                       style: TextStyle(
//                                         color: Color(0xff2E3553),
//                                         fontFamily: "Gilroy",
//                                         fontWeight: FontWeight.bold,
//                                       )),
//                                 ],
//                               ),
//                             ),
//                             RichText(
//                               overflow: TextOverflow.clip,
//                               textAlign: TextAlign.end,
//                               textDirection: TextDirection.rtl,
//                               softWrap: true,
//                               textScaleFactor: 1,
//                               text: TextSpan(
//                                 text: 'from',
//                                 style: TextStyle(
//                                   color: Color(0xff2E3553),
//                                   fontSize: deviceSize.width * 0.03,
//                                   fontFamily: "Gilroy",
//                                 ),
//                                 children: const <TextSpan>[
//                                   TextSpan(
//                                       text: ' \$100',
//                                       style: TextStyle(
//                                         color: Color(0xff2E3553),
//                                         fontFamily: "Gilroy",
//                                         fontWeight: FontWeight.bold,
//                                       )),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: deviceSize.height * 0.002,
//                         ),
//                         Center(
//                           child: Stack(
//                             children: [
//                               Container(
//                                 width: deviceSize.width,
//                                 height: 2,
//                                 decoration: BoxDecoration(
//                                   color: Color(0xffF4F4F4),
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(10)),
//                                 ),
//                               ),
//                               LayoutBuilder(
//                                 builder: (context, constraints) => Container(
//                                   width: constraints.maxWidth * (50 / 100),
//                                   height: 2,
//                                   decoration: BoxDecoration(
//                                     color: Color(0xff48BFAA),
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(0)),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           height: deviceSize.height * 0.007,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             RichText(
//                               overflow: TextOverflow.clip,
//                               textAlign: TextAlign.end,
//                               textDirection: TextDirection.rtl,
//                               softWrap: true,
//                               textScaleFactor: 1,
//                               text: TextSpan(
//                                 text: 'Started: ',
//                                 style: TextStyle(
//                                   color: Color(0xff2E3553),
//                                   fontFamily: "Gilroy",
//                                   fontSize: deviceSize.width * 0.028,
//                                 ),
//                                 children: const <TextSpan>[
//                                   TextSpan(
//                                       text: '12.12.2022',
//                                       style: TextStyle(
//                                         color: Color(0xff2E3553),
//                                         fontFamily: "Gilroy",
//                                         fontWeight: FontWeight.bold,
//                                       )),
//                                 ],
//                               ),
//                             ),
//                             RichText(
//                               overflow: TextOverflow.clip,
//                               textAlign: TextAlign.end,
//                               textDirection: TextDirection.rtl,
//                               softWrap: true,
//                               textScaleFactor: 1,
//                               text: TextSpan(
//                                 text: 'Deadline: ',
//                                 style: TextStyle(
//                                   color: Color(0xff2E3553),
//                                   fontFamily: "Gilroy",
//                                   fontSize: deviceSize.width * 0.028,
//                                 ),
//                                 children: const <TextSpan>[
//                                   TextSpan(
//                                       text: '12.09.2023',
//                                       style: TextStyle(
//                                         color: Color(0xff2E3553),
//                                         fontFamily: "Gilroy",
//                                         fontWeight: FontWeight.bold,
//                                       )),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   );
//                 })),
//         SizedBox(
//           height: 10,
//         ),
//         Text(
//           "COMPLETED",
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         Expanded(
//             child: ListView.builder(
//                 itemCount: 3,
//                 itemBuilder: (context, index) {
//                   return Container(
//                     padding: EdgeInsets.all(15),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(10),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.shade100,
//                           blurRadius:
//                               50, // has the effect of softening the shadow
//                           spreadRadius:
//                               1, // has the effect of extending the shadow
//                           offset: Offset(
//                             5.0, // horizontal, move right 10
//                             5.0, // vertical, move down 10
//                           ),
//                         )
//                       ],
//                     ),
//                     child: Column(
//                       // mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               "Borrowing Money for \nschool trip and launch ",
//                               style: TextStyle(
//                                 fontSize: 13,
//                                 fontFamily: "Gilroy",
//                                 fontWeight: FontWeight.w800,
//                               ),
//                             ),
//                             RichText(
//                               overflow: TextOverflow.clip,
//                               textAlign: TextAlign.end,
//                               textDirection: TextDirection.rtl,
//                               softWrap: true,
//                               textScaleFactor: 1,
//                               text: TextSpan(
//                                 text: 'Dept accepted\nby ',
//                                 style: TextStyle(
//                                   fontSize: 10,
//                                   color: Color(0xff2E3553),
//                                   fontFamily: "Gilroy",
//                                 ),
//                                 children: const <TextSpan>[
//                                   TextSpan(
//                                       text: 'Lina Cocona',
//                                       style: TextStyle(
//                                         color: Color(0xff2E3553),
//                                         fontFamily: "Gilroy",
//                                         fontWeight: FontWeight.bold,
//                                       )),
//                                 ],
//                               ),
//                             )
//                           ],
//                         ),
//                         SizedBox(
//                           height: deviceSize.height * 0.01,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             RichText(
//                               overflow: TextOverflow.clip,
//                               textAlign: TextAlign.end,
//                               textDirection: TextDirection.rtl,
//                               softWrap: true,
//                               textScaleFactor: 1,
//                               text: TextSpan(
//                                 text: 'Paid',
//                                 style: TextStyle(
//                                   color: Color(0xff2E3553),
//                                   fontSize: deviceSize.width * 0.03,
//                                   fontFamily: "Gilroy",
//                                 ),
//                                 children: const <TextSpan>[
//                                   TextSpan(
//                                       text: ' \$50',
//                                       style: TextStyle(
//                                         color: Color(0xff2E3553),
//                                         fontFamily: "Gilroy",
//                                         fontWeight: FontWeight.bold,
//                                       )),
//                                 ],
//                               ),
//                             ),
//                             RichText(
//                               overflow: TextOverflow.clip,
//                               textAlign: TextAlign.end,
//                               textDirection: TextDirection.rtl,
//                               softWrap: true,
//                               textScaleFactor: 1,
//                               text: TextSpan(
//                                 text: 'from',
//                                 style: TextStyle(
//                                   color: Color(0xff2E3553),
//                                   fontSize: deviceSize.width * 0.03,
//                                   fontFamily: "Gilroy",
//                                 ),
//                                 children: const <TextSpan>[
//                                   TextSpan(
//                                       text: ' \$100',
//                                       style: TextStyle(
//                                         color: Color(0xff2E3553),
//                                         fontFamily: "Gilroy",
//                                         fontWeight: FontWeight.bold,
//                                       )),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: deviceSize.height * 0.002,
//                         ),
//                         Center(
//                           child: Stack(
//                             children: [
//                               Container(
//                                 width: deviceSize.width,
//                                 height: 2,
//                                 decoration: BoxDecoration(
//                                   color: Color(0xffF4F4F4),
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(10)),
//                                 ),
//                               ),
//                               LayoutBuilder(
//                                 builder: (context, constraints) => Container(
//                                   width: constraints.maxWidth * (50 / 100),
//                                   height: 2,
//                                   decoration: BoxDecoration(
//                                     color: Color(0xff48BFAA),
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(0)),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           height: deviceSize.height * 0.007,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             RichText(
//                               overflow: TextOverflow.clip,
//                               textAlign: TextAlign.end,
//                               textDirection: TextDirection.rtl,
//                               softWrap: true,
//                               textScaleFactor: 1,
//                               text: TextSpan(
//                                 text: 'Started: ',
//                                 style: TextStyle(
//                                   color: Color(0xff2E3553),
//                                   fontFamily: "Gilroy",
//                                   fontSize: deviceSize.width * 0.028,
//                                 ),
//                                 children: const <TextSpan>[
//                                   TextSpan(
//                                       text: '12.12.2022',
//                                       style: TextStyle(
//                                         color: Color(0xff2E3553),
//                                         fontFamily: "Gilroy",
//                                         fontWeight: FontWeight.bold,
//                                       )),
//                                 ],
//                               ),
//                             ),
//                             RichText(
//                               overflow: TextOverflow.clip,
//                               textAlign: TextAlign.end,
//                               textDirection: TextDirection.rtl,
//                               softWrap: true,
//                               textScaleFactor: 1,
//                               text: TextSpan(
//                                 text: 'Deadline: ',
//                                 style: TextStyle(
//                                   color: Color(0xff2E3553),
//                                   fontFamily: "Gilroy",
//                                   fontSize: deviceSize.width * 0.028,
//                                 ),
//                                 children: const <TextSpan>[
//                                   TextSpan(
//                                       text: '12.09.2023',
//                                       style: TextStyle(
//                                         color: Color(0xff2E3553),
//                                         fontFamily: "Gilroy",
//                                         fontWeight: FontWeight.bold,
//                                       )),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   );
//                 })),
//       ],
//     );
//   }
// }

class CustomTabBody extends StatefulWidget {
  CustomTabBody({Key? key}) : super(key: key);

  @override
  State<CustomTabBody> createState() => _CustomTabBodyState();
}

class _CustomTabBodyState extends State<CustomTabBody> {

 
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return ListView(
     
      children: [
        SizedBox(
          height: 10,
        ),
        Text(
          "OPEN",
          style: TextStyle(
             color: Color(0xffD65555),
              fontWeight: FontWeight.bold,
              fontSize: 10),
        ),
        SizedBox(
          height: 5,
        ),
       
        ListView.builder(
            itemCount: 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
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
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Borrowing Money for \nschool trip and launch ",
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: "Gilroy",
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        RichText(
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.end,
                          textDirection: TextDirection.rtl,
                          softWrap: true,
                          textScaleFactor: 1,
                          text: TextSpan(
                            text: 'Dept accepted\nby ',
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                          LayoutBuilder(
                            builder: (context, constraints) => Container(
                              width: constraints.maxWidth * (50 / 100),
                              height: 2,
                              decoration: BoxDecoration(
                                color: Color(0xff48BFAA),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(0)),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              );
            }),
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
        ListView.builder(
            itemCount: 3,
           shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
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
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Borrowing Money for \nschool trip and launch ",
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: "Gilroy",
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        RichText(
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.end,
                          textDirection: TextDirection.rtl,
                          softWrap: true,
                          textScaleFactor: 1,
                          text: TextSpan(
                            text: 'Dept accepted\nby ',
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                          LayoutBuilder(
                            builder: (context, constraints) => Container(
                              width: constraints.maxWidth * (50 / 100),
                              height: 2,
                              decoration: BoxDecoration(
                                color: Color(0xff48BFAA),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(0)),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              );
            }),
    
      ],
    );
  }
}
