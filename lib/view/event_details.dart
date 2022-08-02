import 'package:flutter/material.dart';

import 'package:event_org/model/Events.dart';
import 'package:event_org/utility/common_function.dart';
import 'package:event_org/utility/constants.dart';
import 'package:event_org/view/common_ui.dart';

class EventDetails extends StatefulWidget {
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
  State<EventDetails> createState() => _EventDetailsState();
}

bool show = false;

class _EventDetailsState extends State<EventDetails> {
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 100),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
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
                              widget.allevents.eventBannerImg1 as String, 0),
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
                                myText(widget.allevents.eventName.toString(),
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
                                    widget.allevents.eventLocation.toString(),
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
                                  myText(widget.allevents.eventName.toString(),
                                      size: 30,
                                      fontWeight: FontWeight.w500,
                                      color: black),
                                  myText(
                                      "${widget.allevents.eventStarttime} | ${widget.allevents.eventStartdate}",
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
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SizedBox(
                          height: show
                              ? MediaQuery.of(context).size.height * 0.5
                              : MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.width,
                          child: myText(
                              maxLine: 50,
                              widget.allevents.eventDescription.toString(),
                              size: 18,
                              color: black)),
                    ),
                    GestureDetector(
                      child: myText(
                          maxLine: 1,
                          !show ? "show more" : "show less",
                          size: 18,
                          color: Colors.green[400]),
                      onTap: () {
                        show = !show;
                        setState(() {});
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              border: Border.all(
                                color: Colors.green,
                              ),
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  setIconWithName(
                                    context,
                                    Icons.timer,
                                    "Agenda",
                                  ),
                                  Container(
                                    color: Colors.green,
                                    height: 50,
                                    width: 2,
                                  ),
                                  setIconWithName(
                                      context, Icons.people, "Attendees"),
                                  Container(
                                    color: Colors.green,
                                    height: 50,
                                    width: 2,
                                  ),
                                  setIconWithName(
                                      context, Icons.line_axis, "Sponsor"),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  setIconWithName(context,
                                      Icons.person_outlined, "Speakers"),
                                  Container(
                                    color: Colors.green,
                                    height: 50,
                                    width: 2,
                                  ),
                                  setIconWithName(context,
                                      Icons.shopping_cart_rounded, "Brands"),
                                  Container(
                                    color: Colors.green,
                                    height: 50,
                                    width: 2,
                                  ),
                                  setIconWithName(
                                      context, Icons.shop, "Videos"),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  setIconWithName(context,
                                      Icons.location_on_outlined, "Location"),
                                  Container(
                                    color: Colors.green,
                                    height: 50,
                                    width: 2,
                                  ),
                                  setIconWithName(context, Icons.picture_as_pdf,
                                      "Brochure"),
                                  Container(
                                    color: Colors.green,
                                    height: 50,
                                    width: 2,
                                  ),
                                  setIconWithName(context,
                                      Icons.keyboard_arrow_up_rounded, "more"),
                                ],
                              ),
                            ],
                          )),
                    ),
                  ],
                )),
          ),
        ),
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
