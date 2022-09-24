import 'package:flutter/material.dart';

import '../services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(mainUrl: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(mainUrl: 'Europe/Athens', location: 'Athens', flag: 'greece.png'),
    WorldTime(mainUrl: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(
        mainUrl: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(mainUrl: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(
        mainUrl: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(
        mainUrl: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(
        mainUrl: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];


  void updateTime(index) async{
    WorldTime time = locations[index];
    await time.getTime();
    Navigator.pop(context,{
      'location':time.location,
      'flag':time.flag,
      'time':time.time,
      'isDayTime':time.isDayTime,
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose Location'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              onTap: (){
                updateTime(index);
                print(locations[index].location);

              },
              title: Text(
                locations[index].location
              ),
            ),
          );
        },
      ),
    );
  }
}
