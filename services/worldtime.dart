import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class WorldTime {
  late String location; // location for the UI
  late String time; // the time in that location
  late String flag; // url to an asset flag icon
  String url; // location url for API endpoint
  bool isDayTime = false; // true or false if day or night
  WorldTime({required this.url, required this.location, required this.flag});

  Future<void> getTime() async {
    try {
      // Make the request using the provided url
      final Uri uri = Uri.parse('https://timeapi.io/api/Time/current/zone?timeZone=$url');
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        // Decode the JSON data
        Map<String, dynamic> data = jsonDecode(response.body);

        // Extract the datetime string from the response
        String dateTimeString = data['dateTime'];

        // Create a DateTime object from the string
        DateTime now = DateTime.parse(dateTimeString);
        // Debugging print statement to confirm isDayTime value
        print('Current hour: ${now.hour}');
        // Determine if it's day or night
        isDayTime = now.hour >= 6 && now.hour < 20?true:false;
        print('isDayTime: $isDayTime');

        // Format the time to a human-readable format
        time = DateFormat.jm().format(now);


        print(time);
      } else {
        throw 'Failed to load time data';
      }
    } catch (e) {
      print('Error caught: $e');
      time = 'Could not get the time';
    }
  }
}
