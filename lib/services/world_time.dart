import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  late String location;
  late String time;
  late String flag;
  late String mainUrl; //Europe/London//Asia/Kolkata"
  late bool isDayTime;

  WorldTime(
      {required this.location, required this.flag, required this.mainUrl});

  Future<void> getTime() async {
    var url = Uri.parse('https://worldtimeapi.org/api/timezone/$mainUrl');
    var response = await get(url);
    Map data = jsonDecode(response.body);
    //print(data);
    // print(data['title']);

    String dateTime = data['datetime'];
    String offSet = data['utc_offset'].substring(1, 3);
    print(offSet);
    //print(offSet);

    //Parse Date and Time
    DateTime now = DateTime.parse(dateTime);
    now.add(Duration(hours: int.parse(offSet)));
    print(now);

    //Set Time Property
    isDayTime= now.hour > 6 && now.hour < 20 ? true : false;
    time = DateFormat.jm().format(now);
  }
}
