import 'package:event_org/controller/get_events_cubit.dart';
import 'package:event_org/view/common_ui.dart';
import 'package:event_org/view/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'utility/coustom_routes.dart';

void main() async {
  mainInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<EventCubit>(
          create: (BuildContext context) => EventCubit(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Home.routeName,
        onGenerateRoute: CustomRoutes.generateRoute,
      ),
    );
  }
}
