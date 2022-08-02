import 'package:carousel_slider/carousel_slider.dart';
import 'package:event_org/controller/get_events_cubit.dart';
import 'package:event_org/model/Events.dart';
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

  int currentPos = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventCubit, EventState>(
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () async {
            await showMyDialog(context);
            return false;
          },
          child: Scaffold(
              appBar: AppBar(
                title: myText("Home"),
                actions: [
                  GestureDetector(
                    onTap: () {
                      context.read<EventCubit>().getEvents();
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Icon(Icons.refresh),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Icon(Icons.notifications),
                  ),
                  const Padding(
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
                  ? Center(child: circularProgress(size: 30))
                  : state.status == STATUS.success
                      ? SingleChildScrollView(
                          child: Stack(children: [
                            Column(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height:
                                      MediaQuery.of(context).size.height * 0.42,
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
                                          left: 22, bottom: 5),
                                      child: myText("All Events",
                                          color: Colors.white, size: 25),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        cardSlider(state.events),
                                        dots(state.events.allevents!.length)
                                      ],
                                    ),
                                    Column(children: [
                                      Container(
                                        alignment: Alignment.center,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.35 *
                                                state.events.liveevents!.length,
                                        width:
                                            MediaQuery.of(context).size.width,
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
                      : Center(child: Text(state.error))),
        );
      },
    );
  }

  cardSlider(Events events) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.26,
      width: MediaQuery.of(context).size.width,
      child: CarouselSlider.builder(
          options: CarouselOptions(
            height: 200,
            aspectRatio: 2.0,
            viewportFraction: 0.8,
            onPageChanged: (index, reson) {
              setState(() {
                currentPos = index;
              });
            },
            initialPage: 0,
            enableInfiniteScroll: true,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
          ),
          itemCount: events.allevents!.length,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) =>
                  AllEventCard(context, events.allevents![itemIndex])),
    );
  }

  dots(int size) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.03,
      width: 15 * size.toDouble(),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: size,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 8.0,
            height: 8.0,
            margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: currentPos == index
                  ? const Color.fromRGBO(0, 0, 0, 0.9)
                  : const Color.fromRGBO(0, 0, 0, 0.4),
            ),
          );
        },
      ),
    );
  }
}
