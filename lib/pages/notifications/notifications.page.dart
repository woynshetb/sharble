import 'package:flutter/material.dart';
import 'package:sharble/components/widgets/buttons.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  List<Map> list = [
    {
      "title": "Mark Scozy market dept as completed",
      "date": "12.05.2022",
    },
    {
      "title": "Lisa Cocona sent you a dept request. You can accept or decline",
      "date": "12.05.2022",
    },
    {
      "title": "Lisa Cocona paid \$12.72",
      "date": "12.05.2022",
    },
    {
      "title": "Lisa Cocona paid \$12.72",
      "date": "12.05.2022",
    },
    {
      "title": "Lisa Cocona paid \$12.72",
      "date": "12.05.2022",
    },
    {
      "title": "Lisa Cocona paid \$12.72",
      "date": "12.05.2022",
    },
    {
      "title": "Lisa Cocona paid \$12.72",
      "date": "12.05.2022",
    },
  ];
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
          "Notifications",
          style: TextStyle(
            fontWeight: FontWeight.w900,
            color: Theme.of(context).textTheme.bodyText1!.color,
            fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: list.length,
                       physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 0,
                        vertical: 15,
                      ),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Color(0xffEDEDED)))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            list[index]['title'],
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: index < 3
                                    ? FontWeight.bold
                                    : FontWeight.normal),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            list[index]['date'],
                            style: TextStyle(
                                fontWeight: FontWeight.w200, fontSize: 12),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            GreenPostitve(
                onPressed: () {
                  var nav = Navigator.of(context);
                  nav.pop();
                  nav.pop();
                },
                title: "Back"),
          ],
        ),
      ),
    );
  }
}
