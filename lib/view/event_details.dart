import 'package:flutter/material.dart';

import 'package:event_org/model/Events.dart';
import 'package:event_org/utility/common_function.dart';
import 'package:event_org/utility/constants.dart';
import 'package:event_org/view/common_ui.dart';

class EventDetails extends StatelessWidget {
  const EventDetails({
    Key? key,
    required this.allevents,
  }) : super(key: key);
  static const String routeName = '/EventDetails';

  static getNavigator(Allevents allevents) {
    return MaterialPageRoute(
        settings: const RouteSettings(name: "/EventDetails"),
        builder: (c) {
          return EventDetails(
            allevents: allevents,
          );
        });
  }

  final Allevents allevents;
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
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: myCachedNetworkImage(
                      allevents.eventBannerImg1 as String, 0),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        myText(allevents.eventName.toString(),
                            maxLine: 2,
                            size: 25,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                        const SizedBox(
                          height: 30,
                        ),
                        myText(
                            maxLine: 20,
                            size: 25,
                            allevents.eventLocation.toString(),
                            color: Colors.white),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.13,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          myText(allevents.eventName.toString(),
                              size: 30,
                              fontWeight: FontWeight.w500,
                              color: black),
                          myText(
                              "${allevents.eventStarttime} | ${allevents.eventStartdate}",
                              color: Colors.grey[700],
                              size: 18),
                        ],
                      ),
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
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    child: myText(
                        maxLine: 100,
                        allevents.eventDescription.toString(),
                        size: 18,
                        color: black),
                  )),
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
