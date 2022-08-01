import 'package:event_org/view/event_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'utility/coustom_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: EventDetails.routeName,
      onGenerateRoute: CustomRoutes.generateRoute,
    );
  }
}
