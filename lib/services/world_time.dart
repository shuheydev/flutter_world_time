import 'dart:convert';

import 'package:http/http.dart' as http;

class WorldTime {
  String location; //location name for the UI
  String time; //the time in that location
  String flag; //url to an asset flag icon
  String url; //location url for api endpoint

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      //make the request
      http.Response response =
          await http.get('http://worldtimeapi.org/api/timezone/Asia/Tokyo');
      Map data = jsonDecode(response.body);
      // print(data);

      //get properties from data
      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      // print(dateTime);
      // print(offset);

      //create DateTime object
      DateTime now = DateTime.parse(dateTime);
      int offsetInt = int.parse(offset);
      now = now.add(Duration(hours: offsetInt));

      //set time property
      this.time = now.toString();
    } catch (e) {
      print('caught error: $e');
      this.time = 'could not get time data';
    }
  }
}
