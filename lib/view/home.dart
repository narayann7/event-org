import 'package:carousel_slider/carousel_slider.dart';
import 'package:event_org/utility/common_function.dart';
import 'package:event_org/utility/constants.dart';
import 'package:event_org/view/common_ui.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  static const String routeName = '/Home';

  static getNavigator() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: "/Home"),
        builder: (c) {
          return const Home();
        });
  }

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: myText("Home"),
        elevation: 0,
        backgroundColor: Colors.green[400],
        leadingWidth: 12,
        leading: Container(),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(children: [
          Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Colors.green[400]),
              ),
              Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(color: Colors.white),
              )
            ],
          ),
          Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(color: Colors.transparent),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                type1(context),
                Padding(
                  padding: const EdgeInsets.only(left: 22, bottom: 20),
                  child:
                      myText("Upcoming Events", color: Colors.white, size: 25),
                ),
                Column(
                  children: [
                    CarouselSlider.builder(
                        options: CarouselOptions(
                          height: 200,
                          aspectRatio: 2.0,
                          viewportFraction: 0.8,
                          onPageChanged: (ind, reson) {
                            setState(() {
                              index = ind;
                            });
                          },
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          enlargeCenterPage: true,
                          scrollDirection: Axis.horizontal,
                        ),
                        itemCount: 15,
                        itemBuilder: (BuildContext context, int itemIndex,
                                int pageViewIndex) =>
                            type2(context)),
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}

Widget type2(BuildContext context) {
  return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.blueGrey, borderRadius: BorderRadius.circular(13)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            myText(
                size: 25,
                "hello world heudvdvud diuvbvbf dufgduksjvbdfsk dfjdskbjvfd",
                color: black),
            myButton(context,
                title: "Book now",
                tsize: 20,
                buttonColor: Colors.yellow,
                textColor: Colors.black,
                height: 35,
                width: 110)
          ],
        ),
      ));
}

Widget type1(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
        height: MediaQuery.of(context).size.height * 0.25,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.amber, borderRadius: BorderRadius.circular(13)),
        child: Row(
          children: [
            GestureDetector(
              child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: const BoxDecoration(
                    color: Colors.white,
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
                        myText("hello world ",
                            size: 30,
                            fontWeight: FontWeight.w600,
                            color: black),
                        myText("18-98-2022 | hello",
                            color: Colors.grey[700], size: 18),
                        myText(
                            "hello world heuvud diuvbvbf dufgduksjvbdfsk dfjdskbjvfd",
                            color: black),
                        myButton(context,
                            title: "join now",
                            tsize: 20,
                            buttonColor: Colors.green,
                            height: 35,
                            width: 110)
                      ],
                    ),
                  )),
            )
          ],
        )),
  );
}



    // Row(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: listPaths.map((url) {
    //             int index = listPaths.indexOf(url);
    //             return Container(
    //               width: 8.0,
    //               height: 8.0,
    //               margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
    //               decoration: BoxDecoration(
    //                 shape: BoxShape.circle,
    //                 color: currentPos == index
    //                     ? Color.fromRGBO(0, 0, 0, 0.9)
    //                     : Color.fromRGBO(0, 0, 0, 0.4),
    //               ),
    //             );
    //           }).toList(),