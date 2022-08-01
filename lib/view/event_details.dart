import 'package:event_org/utility/common_function.dart';
import 'package:event_org/utility/constants.dart';
import 'package:event_org/view/common_ui.dart';
import 'package:flutter/material.dart';

class EventDetails extends StatelessWidget {
  const EventDetails({Key? key}) : super(key: key);
  static const String routeName = '/EventDetails';

  static getNavigator() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: "/EventDetails"),
        builder: (c) {
          return const EventDetails();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: myText("Event Details"),
        actions: const [
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Icon(Icons.search),
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Icon(Icons.qr_code_scanner_rounded),
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.green[400],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.amber[100]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        myText("hello world ",
                            size: 30,
                            fontWeight: FontWeight.w500,
                            color: black),
                        myText("18-98-2022 | hello",
                            color: Colors.grey[700], size: 18),
                      ],
                    ),
                    Row(
                      children: const [
                        CircleAvatar(
                          child: Icon(Icons.share),
                        ),
                        Padding(
                          padding: EdgeInsets.all(12.0),
                          child: CircleAvatar(
                            child: Icon(Icons.facebook),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                child: myText(
                    maxLine: 10,
                    "helldvjv dusvuhv dihvdis v dihvusv dsvid jdivhdsivhds vidshvis v  divhidos vdsvdsij dsivhdsi vdhsivhdsv dishvisvhodihvi isdhvid svhih isdhv isho world ",
                    size: 25,
                    color: black),
              ),
            )
          ],
        )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
        child: myButton(
          context,
          title: "Check in",
          tsize: 20,
          buttonColor: Colors.green,
          height: MediaQuery.of(context).size.height * 0.08,
          width: MediaQuery.of(context).size.width,
        ),
      ),
    );
  }
}
