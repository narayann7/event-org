import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:event_org/model/Events.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<dynamic> getAllEvents() async {
    try {
      var response = await http
          .post(Uri.parse("https://admin.gathrr.in/api/getallevent"), body: {
        "userId": "1",
      }).timeout(const Duration(seconds: 60),
              onTimeout: () => throw TimeoutException('Connection Timed Out'));
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        Events events = Events.fromJson(jsonResponse);
        log(events.toString());
        return true;
      }

      return "Something went wrong. Please try again later";
    } catch (e) {
      return e.toString();
    }
  }
}
