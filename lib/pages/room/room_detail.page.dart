import 'package:flutter/material.dart';
import 'package:sharble/components/widgets/buttons.dart';
import 'package:sharble/components/widgets/forms.dart';
import 'package:sharble/pages/room/create_room.page.dart';
import 'package:sharble/pages/room/rooms.page.dart';
import 'package:sharble/services/validator.service.dart';

class RoomDetail extends StatefulWidget {
  const RoomDetail({Key? key}) : super(key: key);

  @override
  State<RoomDetail> createState() => _RoomDetailState();
}

class _RoomDetailState extends State<RoomDetail> {
  customDialog(
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
                          var nav = Navigator.of(context);
                          nav.pop();
                        },
                        title: "Yes")
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
          "Invite Members",
          style: TextStyle(
            fontWeight: FontWeight.w900,
            color: Theme.of(context).textTheme.bodyText1!.color,
            fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 30,
          right: 30,
          bottom: 20,
        ),
        child: Column(
          children: [
            Text(
              "Your room has been created. You can now invite people to join and share together. As admin, you can remove them anytime.",
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Default Currency for this Room",
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
            SizedBox(
              height: 10,
            ),
            Expanded(
                flex: 2,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 3,
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
                        title: const Text(
                          "First One",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        subtitle: const Text("email@email.com"),
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
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: deviceSize.height * 0.03),
                        child: GreenNegative(
                            onPressed: () {
                              customDialog(
                                  title: "Invite Member by Email or Name",
                                  deviceSize: deviceSize,
                                  context: context);
                            },
                            title: "Add member")),
                    GreenPostitve(
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation1, animation2) =>
                                  RoomsPage(),
                              transitionDuration: Duration.zero,
                              reverseTransitionDuration: Duration.zero,
                            ),
                          );
                        },
                        title: "Finish")
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
