import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:sharble/components/widgets/buttons.dart';
import 'package:sharble/components/widgets/forms.dart';
import 'package:sharble/pages/invitation/invitation.page.dart';
import 'package:sharble/pages/login/login.page.dart';
import 'package:sharble/pages/notifications/notifications.page.dart';
import 'package:sharble/services/validator.service.dart';

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
            ),
          );
        });
  }

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
          "Room Settings",
          style: TextStyle(
            fontWeight: FontWeight.w900,
            color: Theme.of(context).textTheme.bodyText1!.color,
            fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
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
              height: 5,
            ),
            DefaultField(
              validator: (value) => FormValidator.validateName(value!),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Members",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
                flex: 1,
                
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 3,
                           physics: NeverScrollableScrollPhysics(),
                    itemBuilder: ((context, index) {
                      return ListTile(
                        leading: Container(
                          width: deviceSize.width * 0.1,
                          height: deviceSize.width * 0.1,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.contain,
                                image: AssetImage("assets/images/girl.png")),
                          ),
                        ),
                        title: Text(
                          "First One",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        subtitle: Text("email@email.com"),
                        trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Visibility(
                              visible: index != 0,
                              child: Image.asset(
                                "assets/images/icon_delete.png",
                                width: deviceSize.width * 0.04,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Visibility(
                              visible: index == 2,
                              child: Text(
                                "Pending",
                                style: TextStyle(fontStyle: FontStyle.italic),
                              ),
                            )
                          ],
                        ),
                      );
                    }))),
            Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: deviceSize.height * 0.01),
                        child: GreenNegative(
                            onPressed: () {
                              customDialogAddMember(
                                  title: "Invite Member by Email or Name",
                                  context: context,
                                  deviceSize: deviceSize);
                            },
                            title: "Add member")),
                    Container(
                      margin: EdgeInsets.only(bottom: deviceSize.height * 0.02),
                      child: Column(
                        children: [
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
                ))
          ],
        ),
      ),
    );
  }
}
