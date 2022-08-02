import 'package:carousel_slider/carousel_slider.dart';
import 'package:event_org/controller/get_events_cubit.dart';
import 'package:event_org/model/event_state.dart';
import 'package:event_org/utility/common_function.dart';
import 'package:event_org/utility/constants.dart';
import 'package:event_org/view/common_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  @override
  void initState() {
    context.read<EventCubit>().getEvents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EventCubit, EventState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: myText("Home"),
              actions: const [
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Icon(Icons.notifications),
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Icon(Icons.menu),
                ),
              ],
              elevation: 0,
              backgroundColor: Colors.green[400],
              leadingWidth: 12,
              leading: Container(),
            ),
            backgroundColor: Colors.white,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            body: state.status == STATUS.loading
                ? Center(child: circularProgress())
                : state.status == STATUS.success
                    ? SingleChildScrollView(
                        child: Stack(children: [
                          Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
                                width: MediaQuery.of(context).size.width,
                                decoration:
                                    BoxDecoration(color: Colors.green[400]),
                              ),
                              Container(
                                alignment: Alignment.center,
                                height:
                                    MediaQuery.of(context).size.height * 0.6,
                                width: MediaQuery.of(context).size.width,
                                decoration:
                                    const BoxDecoration(color: Colors.white),
                              )
                            ],
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: const BoxDecoration(
                                  color: Colors.transparent),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  LiveEventCard(
                                    context,
                                    state.events.liveevents![1],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 22, bottom: 20),
                                    child: myText("All Events",
                                        color: Colors.white, size: 25),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    height: MediaQuery.of(context).size.height *
                                        0.26,
                                    width: MediaQuery.of(context).size.width,
                                    child: CarouselSlider.builder(
                                        options: CarouselOptions(
                                          height: 200,
                                          aspectRatio: 2.0,
                                          viewportFraction: 0.8,
                                          onPageChanged: (ind, reson) {},
                                          initialPage: 0,
                                          enableInfiniteScroll: true,
                                          enlargeCenterPage: true,
                                          scrollDirection: Axis.horizontal,
                                        ),
                                        itemCount:
                                            state.events.allevents!.length,
                                        itemBuilder: (BuildContext context,
                                                int itemIndex,
                                                int pageViewIndex) =>
                                            AllEventCard(
                                                context,
                                                state.events
                                                    .allevents![itemIndex])),
                                  ),
                                  Column(children: [
                                    Container(
                                      alignment: Alignment.center,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.35 *
                                              state.events.liveevents!.length,
                                      width: MediaQuery.of(context).size.width,
                                      child: ListView.builder(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount:
                                              state.events.liveevents!.length,
                                          itemBuilder: (context, index) {
                                            return LiveEventCard(
                                              context,
                                              state.events.liveevents![index],
                                            );
                                          }),
                                    )
                                  ])
                                ],
                              )),
                        ]),
                      )
                    : Center(child: Text(state.error)));
      },
    );
  }
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



    
//  Container(
//                 alignment: Alignment.center,
//                 height: MediaQuery.of(context).size.height * 0.1,
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(color: Colors.amber[100]),
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: 15,
//                   itemBuilder: (BuildContext context, int index) {
//                     return Container(
//                       width: 8.0,
//                       height: 8.0,
//                       margin: const EdgeInsets.symmetric(
//                           vertical: 10.0, horizontal: 2.0),
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: currentPos == index
//                             ? const Color.fromRGBO(0, 0, 0, 0.9)
//                             : const Color.fromRGBO(0, 0, 0, 0.4),
//                       ),
//                     );
//                   },
//                 ),
//               )
