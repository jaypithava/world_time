import 'package:world_time/services/world_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void setWorldTime() async {
    WorldTime instance = WorldTime(location: "Europe", flag: "Europe.png", mainUrl: "Europe/London");
    await instance.getTime();
    print(instance.time);
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDayTime':instance.isDayTime,
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setWorldTime();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: const Center(
        child: Padding(
          padding:  EdgeInsets.all(18.0),
          child: SafeArea(
            child: SpinKitWave(
              color: Colors.white,
              size: 50.0 ,
            ),
          ),
        ),
      ),
    );
  }
}
