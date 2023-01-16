import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:sharble/components/widgets/buttons.dart';
import 'package:sharble/components/widgets/forms.dart';
import 'package:sharble/pages/invitation/invitation.page.dart';
import 'package:sharble/pages/login/login.page.dart';
import 'package:sharble/pages/notifications/notifications.page.dart';
import 'package:sharble/services/validator.service.dart';
import 'package:velocity_x/velocity_x.dart';

class RoomSettingPage extends StatefulWidget {
  const RoomSettingPage({Key? key}) : super(key: key);

  @override
  State<RoomSettingPage> createState() => _RoomSettingPageState();
}

class _RoomSettingPageState extends State<RoomSettingPage> {
  customDialogAddMember(
      {required String title,
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
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
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
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) =>
                                InvitationPage(),
                            transitionDuration: Duration.zero,
                            reverseTransitionDuration: Duration.zero,
                          ),
                        );
                      },
                      title: "Yes")
                ],
              ),
            ),
          );
        });
  }

  customDialog(
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

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
                left: 15,
              ),
              decoration: const BoxDecoration(
                  color: Color(0xffF5F5F5), shape: BoxShape.circle),
              child: SvgPicture.asset(
                "assets/images/assets/icon-nav-button-back.svg",
                width: 15,
                height: 15,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        centerTitle: false,
        title: Text(
          "Room Settings",
          style: TextStyle(
            fontWeight: FontWeight.w900,
            color: Theme.of(context).textTheme.bodyText1!.color,
            fontSize: 14,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Room Name",
                    style:
                        TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                DefaultField(
                  validator: (value) => FormValidator.validateName(value!),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Members",
                    style:
                        TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: 3,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: ((context, index) {
                      return Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: deviceSize.width * 0.12,
                                  height: deviceSize.width * 0.12,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        fit: BoxFit.contain,
                                        image: AssetImage(
                                            "assets/images/girl.png")),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "First One",
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text("email@email.com"),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Visibility(
                                  visible: index != 0,
                                  child: SvgPicture.asset(
                                    "assets/images/assets/icon-bin-blue.svg",
                                    width: deviceSize.width * 0.04,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Visibility(
                                  visible: index == 2,
                                  child: Text(
                                    "Pending",
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    })),
               
              ],
            ),

            // SizedBox(
            //   height: deviceSize.height*0.26,
            // ),

            Container(
              margin: EdgeInsets.only(bottom: deviceSize.height * 0.02),
              child: Column(
                children: [
                   Container(
                  margin: EdgeInsets.only(top: deviceSize.height * 0.02),
                  child: GreenNegative(
                      onPressed: () {
                        customDialogAddMember(
                            title: "Invite Member by Email or Name",
                            context: context,
                            deviceSize: deviceSize);
                      },
                      title: "Add member"),
                ),
                SizedBox(
                  height: deviceSize.height*0.25,
                ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          customDialog(
                              title: "Delete Room",
                              description:
                                  "Are you sure you want to delete this room? It can’t be undone.",
                              deviceSize: deviceSize,
                              context: context);
                        },
                        child: Text(
                          "Delete Room",
                          style: TextStyle(
                            color: Color(0xffD65555),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "/",
                        style: TextStyle(
                          color: Color(0xffD65555),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {
                          customDialog(
                              title: "Leave Room",
                              description:
                                  "Are you sure you want to leave this room? It can’t be undone.",
                              deviceSize: deviceSize,
                              context: context);
                        },
                        child: Text(
                          "Leave Room",
                          style: TextStyle(
                            color: Color(0xffD65555),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: deviceSize.height * 0.02),
                  GreenPostitve(
                      onPressed: () {
                        // var nav = Navigator.of(context);
                        // nav.pop();
                        // nav.pop();
                      },
                      title: "Update")
                ],
              ),
            )
          ],
        ),
      ),
      // floatingActionButton: Visibility(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       Container(
      //         margin: EdgeInsets.only(top: deviceSize.height * 0.01),
      //         child: GreenNegative(
      //             onPressed: () {
      //               customDialogAddMember(
      //                   title: "Invite Member by Email or Name",
      //                   context: context,
      //                   deviceSize: deviceSize);
      //             },
      //             title: "Add member"),
      //       ),
      //       Container(
      //         margin: EdgeInsets.only(bottom: deviceSize.height * 0.02),
      //         child: Column(
      //           children: [
      //             Row(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: [
      //                 InkWell(
      //                   onTap: () {
      //                     customDialog(
      //                         title: "Delete Room",
      //                         description:
      //                             "Are you sure you want to delete this room? It can’t be undone.",
      //                         deviceSize: deviceSize,
      //                         context: context);
      //                   },
      //                   child: Text(
      //                     "Delete Room",
      //                     style: TextStyle(
      //                       color: Color(0xffD65555),
      //                       fontWeight: FontWeight.bold,
      //                     ),
      //                   ),
      //                 ),
      //                 SizedBox(
      //                   width: 5,
      //                 ),
      //                 Text(
      //                   "/",
      //                   style: TextStyle(
      //                     color: Color(0xffD65555),
      //                     fontWeight: FontWeight.w600,
      //                   ),
      //                 ),
      //                 SizedBox(
      //                   width: 5,
      //                 ),
      //                 InkWell(
      //                   onTap: () {
      //                     customDialog(
      //                         title: "Leave Room",
      //                         description:
      //                             "Are you sure you want to leave this room? It can’t be undone.",
      //                         deviceSize: deviceSize,
      //                         context: context);
      //                   },
      //                   child: Text(
      //                     "Leave Room",
      //                     style: TextStyle(
      //                       color: Color(0xffD65555),
      //                       fontWeight: FontWeight.bold,
      //                     ),
      //                   ),
      //                 ),
      //               ],
      //             ),
      //             SizedBox(height: deviceSize.height * 0.02),
      //             GreenPostitve(
      //                 onPressed: () {
      //                   // var nav = Navigator.of(context);
      //                   // nav.pop();
      //                   // nav.pop();
      //                 },
      //                 title: "Update")
      //           ],
      //         ),
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
