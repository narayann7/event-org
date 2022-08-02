import 'package:cached_network_image/cached_network_image.dart';
import 'package:event_org/model/Events.dart';
import 'package:event_org/utility/common_function.dart';
import 'package:event_org/utility/constants.dart';
import 'package:event_org/view/event_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              myText('Do you want to exit the app', color: Colors.black),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: myText('Yes', color: Colors.black),
            onPressed: () async {
              SystemNavigator.pop();
            },
          ),
          TextButton(
            child: myText('No', color: Colors.black),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Widget AllEventCard(BuildContext context, Allevents allevents) {
  return Stack(
    children: [
      Container(
        height: MediaQuery.of(context).size.height * 0.25,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.transparent, borderRadius: BorderRadius.circular(13)),
        child: myCachedNetworkImage(allevents.eventBannerImg1 as String, 2),
      ),
      Container(
        height: MediaQuery.of(context).size.height * 0.25,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.8),
            borderRadius: BorderRadius.circular(13)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              myText(
                  size: 25,
                  allevents.eventDescription.toString(),
                  color: Colors.white),
              GestureDetector(
                onTap: () {
                  teleportWithArguments(
                      context, EventDetails.routeName, allevents);
                },
                child: myButton(context,
                    title: "Book now",
                    tsize: 20,
                    buttonColor: Colors.yellow,
                    textColor: Colors.black,
                    height: 35,
                    width: 110),
              )
            ],
          ),
        ),
      )
    ],
  );
}

Widget LiveEventCard(BuildContext context, Allevents allevents) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
        height: MediaQuery.of(context).size.height * 0.25,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10.0,
            spreadRadius: 0,
            offset: Offset(1.0, 0), // shadow direction: bottom right
          )
        ], borderRadius: BorderRadius.circular(13)),
        child: Row(
          children: [
            Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 237, 237, 237),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(13),
                      bottomLeft: Radius.circular(13)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      myText(allevents.eventName.toString(),
                          maxLine: 2,
                          size: 25,
                          fontWeight: FontWeight.w600,
                          color: black),
                      myText(
                          "${allevents.eventStarttime} | ${allevents.eventStartdate}",
                          color: Colors.grey[700],
                          size: 18),
                      myText(
                        allevents.eventDescription.toString(),
                        color: black,
                        size: 18,
                      ),
                      GestureDetector(
                          onTap: () {
                            teleportWithArguments(
                                context, EventDetails.routeName, allevents);
                          },
                          child: myButton(context,
                              title: "join now",
                              tsize: 20,
                              buttonColor: Colors.green,
                              height: 35,
                              width: 110))
                    ],
                  ),
                )),
            Container(
                width: MediaQuery.of(context).size.width * 0.4,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(13),
                      bottomRight: Radius.circular(13)),
                ),
                child: myCachedNetworkImage(
                    allevents.eventBannerImg1 as String, 1))
          ],
        )),
  );
}

myCachedNetworkImage(String url, int type) {
  return CachedNetworkImage(
      imageUrl: url,
      errorWidget: (context, url, error) => const Text("error"),
      imageBuilder: (context, imageProvider) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: type == 0
                ? BorderRadius.circular(0)
                : type == 2
                    ? BorderRadius.circular(13)
                    : const BorderRadius.only(
                        topRight: Radius.circular(13),
                        bottomRight: Radius.circular(13)),
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          ),
        );
      },
      placeholder: (context, url) => circularProgress());
}

myButton(
  BuildContext context, {
  String? title,
  Color? buttonColor,
  double height = 20,
  double width = 20,
  double tsize = 60,
  Color? textColor,
}) {
  textColor = textColor ?? Colors.white;
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12), color: buttonColor),
    child: Center(
      child: myText(title.toString(), color: textColor, size: tsize),
    ),
  );
}

mainInit() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

setIconWithName(
  BuildContext context,
  IconData icon,
  String name,
) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * 0.25,
    child: Column(
      children: [
        Icon(
          icon,
          size: 30,
          color: Colors.grey[700],
        ),
        const SizedBox(
          width: 10,
        ),
        myText(name, size: 20, color: Colors.grey[700])
      ],
    ),
  );
}
