import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sharble/components/widgets/buttons.dart';

class InvitationPage extends StatefulWidget {
  const InvitationPage({Key? key}) : super(key: key);

  @override
  State<InvitationPage> createState() => _InvitationPageState();
}

class _InvitationPageState extends State<InvitationPage> {
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
        leading:  InkWell(
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
          "Invitations",
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Theme.of(context).textTheme.bodyText1!.color,
            fontSize: 14,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                  height: deviceSize.height * 0.1,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Invitation",
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyText1!.color,
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(
                  height: deviceSize.height * 0.03,
                ),
                Image.asset(
                  "assets/images/hand_phone.png",
                  width: deviceSize.width * 1,
                ),
                SizedBox(
                  height: deviceSize.height * 0.03,
                ),
                RichText(
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                  softWrap: true,
                  textScaleFactor: 1,
                  text: TextSpan(
                    text: 'Mark Scoy',
                    style: TextStyle(
                      color: Color(0xff2E3553),
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                    children: const <TextSpan>[
                      TextSpan(
                          text: ' added you to the  Shopping List Room\n',
                          style: TextStyle(
                              color: Color(0xff2E3553),
                              fontFamily: "Gilroy",
                              fontWeight: FontWeight.w100)),
                      TextSpan(
                          text: 'Grocery List.',
                          style: TextStyle(
                              color: Color(0xff2E3553),
                              fontFamily: "Gilroy",
                              fontSize: 13,
                              fontWeight: FontWeight.w900)),
                      TextSpan(
                          text: ' You can accept or decline the',
                          style: TextStyle(
                              color: Color(0xff2E3553),
                              fontFamily: "Gilroy",
                              fontWeight: FontWeight.w100)),
                      TextSpan(
                          text: '\ninvitation.',
                          style: TextStyle(
                              color: Color(0xff2E3553),
                              fontFamily: "Gilroy",
                              fontWeight: FontWeight.w100)),
                    ],
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(
                bottom: deviceSize.height * 0.05,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GreenNegative(
                      val: deviceSize.width * 0.1,
                      onPressed: () {
                        var nav = Navigator.of(context);
                        nav.pop();
                      },
                      title: "Decline"),
                  GreenPostitve(
                      onPressed: () {
                        var nav = Navigator.of(context);
                        nav.pop();
                      },
                      title: "Accept")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
